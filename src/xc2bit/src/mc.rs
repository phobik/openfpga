/*
Copyright (c) 2016-2017, Robert Ou <rqou@robertou.com> and contributors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//! Contains functions pertaining to macrocells

use std::io;
use std::io::Write;

extern crate jedec;
use self::jedec::*;

use *;
use fusemap_physical::{mc_block_loc};
use util::{LinebreakSet};
use zia::{zia_get_row_width};

/// Clock source for the register in a macrocell
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCRegClkSrc {
    #[bits = "x00"]
    GCK0,
    #[bits = "x10"]
    GCK1,
    #[bits = "x01"]
    GCK2,
    #[bits = "011"]
    PTC,
    #[bits = "111"]
    CTC,
}

/// Reset source for the register in a macrocell
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCRegResetSrc {
    #[bits = "11"]
    Disabled,
    #[bits = "00"]
    PTA,
    #[bits = "01"]
    GSR,
    #[bits = "10"]
    CTR,
}

/// Set source for the register in a macrocell
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCRegSetSrc {
    #[bits = "11"]
    Disabled,
    #[bits = "00"]
    PTA,
    #[bits = "01"]
    GSR,
    #[bits = "10"]
    CTS,
}

/// Mode of the register in a macrocell.
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCRegMode {
    /// D-type flip-flop
    #[bits = "00"]
    DFF,
    /// Transparent latch
    #[bits = "01"]
    LATCH,
    /// Toggle flip-flop
    #[bits = "10"]
    TFF,
    /// D-type flip-flop with clock-enable pin
    #[bits = "11"]
    DFFCE,
}

/// Mux selection for the ZIA input from this macrocell. The ZIA input can be chosen to come from either the XOR gate
/// or from the output of the register.
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCFeedbackMode {
    #[bits = "X1"]
    Disabled,
    #[bits = "00"]
    COMB,
    #[bits = "10"]
    REG,
}

/// Mux selection for the "not from OR gate" input to the XOR gate. The XOR gate in a macrocell contains two inputs,
/// the output of the corresponding OR term from the PLA and a specific dedicated AND term from the PLA.
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
#[derive(BitPattern)]
pub enum XC2MCXorMode {
    /// A constant zero which results in this XOR outputting the value of the OR term
    #[bits = "00"]
    ZERO,
    /// A constant one which results in this XOR outputting the complement of the OR term
    #[bits = "11"]
    ONE,
    /// XOR the OR term with the special product term C
    #[bits = "10"]
    PTC,
    /// XNOR the OR term with the special product term C
    #[bits = "01"]
    PTCB,
}

/// Represents a macrocell.
#[derive(Copy, Clone, Eq, PartialEq, Hash, Debug, Serialize, Deserialize)]
pub struct XC2Macrocell {
    /// Clock source for the register
    pub clk_src: XC2MCRegClkSrc,
    /// Specifies the clock polarity for the register
    ///
    /// `false` = rising edge triggered flip-flop, transparent-when-high latch
    ///
    /// `true` = falling edge triggered flip-flop, transparent-when-low latch
    pub clk_invert_pol: bool,
    /// Specifies whether flip-flop are triggered on both clock edges
    ///
    /// It is currently unknown what happens when this is used on a transparent latch
    pub is_ddr: bool,
    /// Reset source for the register
    pub r_src: XC2MCRegResetSrc,
    /// Set source for the register
    pub s_src: XC2MCRegSetSrc,
    /// Power-up state of the register
    ///
    /// `false` = init to 0, `true` = init to 1
    pub init_state: bool,
    /// Register mode
    pub reg_mode: XC2MCRegMode,
    /// ZIA input mode for feedback from this macrocell
    pub fb_mode: XC2MCFeedbackMode,
    /// Controls the input for the register
    ///
    /// `false` = use the output of the XOR gate (combinatorial path), `true` = use IOB direct path
    /// (`true` is illegal for buried macrocells in the larger devices)
    pub ff_in_ibuf: bool,
    /// Controls the "other" (not from the OR term) input to the XOR gate
    pub xor_mode: XC2MCXorMode,
}

impl Default for XC2Macrocell {
    /// Returns a "default" macrocell configuration.
    // XXX what should the default state be???
    fn default() -> Self {
        XC2Macrocell {
            clk_src: XC2MCRegClkSrc::GCK0,
            clk_invert_pol: false,
            is_ddr: false,
            r_src: XC2MCRegResetSrc::Disabled,
            s_src: XC2MCRegSetSrc::Disabled,
            init_state: true,
            reg_mode: XC2MCRegMode::DFF,
            fb_mode: XC2MCFeedbackMode::Disabled,
            ff_in_ibuf: false,
            xor_mode: XC2MCXorMode::ZERO,
        }
    }
}

pub static MC_TO_ROW_MAP_LARGE: [usize; MCS_PER_FB] = 
    [0, 3, 5, 8, 10, 13, 15, 18, 20, 23, 25, 28, 30, 33, 35, 38];

impl XC2Macrocell {
    /// Dump a human-readable explanation of the settings for this macrocell to the given `writer` object.
    /// `fb` and `mc` must be the function block number and macrocell number of this macrocell.
    pub fn dump_human_readable(&self, fb: u32, mc: u32, writer: &mut Write) -> Result<(), io::Error> {
        write!(writer, "\n")?;
        write!(writer, "FF configuration for FB{}_{}\n", fb + 1, mc + 1)?;
        write!(writer, "FF mode: {}\n", match self.reg_mode {
            XC2MCRegMode::DFF => "D flip-flop",
            XC2MCRegMode::LATCH => "transparent latch",
            XC2MCRegMode::TFF => "T flip-flop",
            XC2MCRegMode::DFFCE => "D flip-flop with clock-enable",
        })?;
        write!(writer, "initial state: {}\n", if self.init_state {1} else {0})?;
        write!(writer, "{}-edge triggered\n", if self.clk_invert_pol {"falling"} else {"rising"})?;
        write!(writer, "DDR: {}\n", if self.is_ddr {"yes"} else {"no"})?;
        write!(writer, "clock source: {}\n", match self.clk_src {
            XC2MCRegClkSrc::GCK0 => "GCK0",
            XC2MCRegClkSrc::GCK1 => "GCK1",
            XC2MCRegClkSrc::GCK2 => "GCK2",
            XC2MCRegClkSrc::PTC => "PTC",
            XC2MCRegClkSrc::CTC => "CTC",
        })?;
        write!(writer, "set source: {}\n", match self.s_src {
            XC2MCRegSetSrc::Disabled => "disabled",
            XC2MCRegSetSrc::PTA => "PTA",
            XC2MCRegSetSrc::GSR => "GSR",
            XC2MCRegSetSrc::CTS => "CTS",
        })?;
        write!(writer, "reset source: {}\n", match self.r_src {
            XC2MCRegResetSrc::Disabled => "disabled",
            XC2MCRegResetSrc::PTA => "PTA",
            XC2MCRegResetSrc::GSR => "GSR",
            XC2MCRegResetSrc::CTR => "CTR",
        })?;
        write!(writer, "using ibuf direct path: {}\n", if self.ff_in_ibuf {"yes"} else {"no"})?;
        write!(writer, "XOR gate input: {}\n", match self.xor_mode {
            XC2MCXorMode::ZERO => "0",
            XC2MCXorMode::ONE => "1",
            XC2MCXorMode::PTC => "PTC",
            XC2MCXorMode::PTCB => "~PTC",
        })?;
        write!(writer, "ZIA feedback: {}\n", match self.fb_mode {
            XC2MCFeedbackMode::Disabled => "disabled",
            XC2MCFeedbackMode::COMB => "combinatorial",
            XC2MCFeedbackMode::REG => "registered",
        })?;

        Ok(())
    }

    /// Write the crbit representation of this macrocell to the given `fuse_array`.
    pub fn to_crbit(&self, device: XC2Device, fb: u32, mc: u32, fuse_array: &mut FuseArray) {
        let (x, y, mirror) = mc_block_loc(device, fb);
        // direction
        let x = x as i32;
        let d = if !mirror {1} else {-1};
        match device {
            XC2Device::XC2C32 | XC2Device::XC2C32A => {
                // The "32" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // aclk
                fuse_array.set((x + d * 0) as usize, y + 0, self.clk_src.encode().0);

                // clkop
                fuse_array.set((x + d * 1) as usize, y + 0, self.clk_invert_pol);

                // clk
                let clk = (self.clk_src.encode().1, self.clk_src.encode().2);
                fuse_array.set((x + d * 2) as usize, y + 0, clk.0);
                fuse_array.set((x + d * 3) as usize, y + 0, clk.1);

                // clkfreq
                fuse_array.set((x + d * 4) as usize, y + 0, self.is_ddr);

                // r
                let r = self.r_src.encode();
                fuse_array.set((x + d * 5) as usize, y + 0, r.0);
                fuse_array.set((x + d * 6) as usize, y + 0, r.1);

                // p
                let p = self.s_src.encode();
                fuse_array.set((x + d * 7) as usize, y + 0, p.0);
                fuse_array.set((x + d * 8) as usize, y + 0, p.1);

                // regmod
                let regmod = self.reg_mode.encode();
                fuse_array.set((x + d * 0) as usize, y + 1, regmod.0);
                fuse_array.set((x + d * 1) as usize, y + 1, regmod.1);

                // skipped INz (belongs to IOB)

                // fb
                let fb = self.fb_mode.encode();
                fuse_array.set((x + d * 4) as usize, y + 1, fb.0);
                fuse_array.set((x + d * 5) as usize, y + 1, fb.1);

                // inreg
                fuse_array.set((x + d * 6) as usize, y + 1, !self.ff_in_ibuf);

                // skipped St (belongs to IOB)

                // xorin
                let xorin = self.xor_mode.encode();
                fuse_array.set((x + d * 8) as usize, y + 1, xorin.0);
                fuse_array.set((x + d * 0) as usize, y + 2, xorin.1);

                // skipped RegCom (belongs to IOB)
                // skipped Oe (belongs to IOB)
                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // pu
                fuse_array.set((x + d * 8) as usize, y + 2, !self.init_state);
            },
            XC2Device::XC2C64 | XC2Device::XC2C64A => {
                // The "64" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // aclk
                fuse_array.set((x + d * 8) as usize, y + 0, self.clk_src.encode().0);

                // clkop
                fuse_array.set((x + d * 7) as usize, y + 0, self.clk_invert_pol);

                // clk
                let clk = (self.clk_src.encode().1, self.clk_src.encode().2);
                fuse_array.set((x + d * 5) as usize, y + 0, clk.0);
                fuse_array.set((x + d * 6) as usize, y + 0, clk.1);

                // clkfreq
                fuse_array.set((x + d * 4) as usize, y + 0, self.is_ddr);

                // r
                let r = self.r_src.encode();
                fuse_array.set((x + d * 2) as usize, y + 0, r.0);
                fuse_array.set((x + d * 3) as usize, y + 0, r.1);

                // p
                let p = self.s_src.encode();
                fuse_array.set((x + d * 0) as usize, y + 0, p.0);
                fuse_array.set((x + d * 1) as usize, y + 0, p.1);

                // regmod
                let regmod = self.reg_mode.encode();
                fuse_array.set((x + d * 7) as usize, y + 1, regmod.0);
                fuse_array.set((x + d * 8) as usize, y + 1, regmod.1);

                // skipped INz (belongs to IOB)

                // fb
                let fb = self.fb_mode.encode();
                fuse_array.set((x + d * 3) as usize, y + 1, fb.0);
                fuse_array.set((x + d * 4) as usize, y + 1, fb.1);

                // inreg
                fuse_array.set((x + d * 2) as usize, y + 1, !self.ff_in_ibuf);

                // skipped St (belongs to IOB)

                // xorin
                let xorin = self.xor_mode.encode();
                fuse_array.set((x + d * 7) as usize, y + 2, xorin.0);
                fuse_array.set((x + d * 8) as usize, y + 2, xorin.1);

                // skipped RegCom (belongs to IOB)
                // skipped Oe (belongs to IOB)
                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // pu
                fuse_array.set((x + d * 0) as usize, y + 2, !self.init_state);
            },
            XC2Device::XC2C256 => {
                // The "256" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // skipped InMod (belongs to IOB)

                // fb
                let fb = self.fb_mode.encode();
                fuse_array.set((x + d * 2) as usize, y + 0, fb.0);
                fuse_array.set((x + d * 3) as usize, y + 0, fb.1);

                // skipped DG (belongs to IOB)

                // clkop
                fuse_array.set((x + d * 5) as usize, y + 0, self.clk_invert_pol);

                // clkfreq
                fuse_array.set((x + d * 6) as usize, y + 0, self.is_ddr);

                // clk
                let clk = (self.clk_src.encode().1, self.clk_src.encode().2);
                fuse_array.set((x + d * 7) as usize, y + 0, clk.0);
                fuse_array.set((x + d * 8) as usize, y + 0, clk.1);

                // aclk
                fuse_array.set((x + d * 9) as usize, y + 0, self.clk_src.encode().0);

                // pu
                fuse_array.set((x + d * 0) as usize, y + 1, !self.init_state);

                // p
                let p = self.s_src.encode();
                fuse_array.set((x + d * 1) as usize, y + 1, p.0);
                fuse_array.set((x + d * 2) as usize, y + 1, p.1);

                // skipped Oe (belongs to IOB)
                // skipped INz (belongs to IOB)

                // inreg
                fuse_array.set((x + d * 9) as usize, y + 1, !self.ff_in_ibuf);

                // xorin
                let xorin = self.xor_mode.encode();
                fuse_array.set((x + d * 0) as usize, y + 2, xorin.0);
                fuse_array.set((x + d * 1) as usize, y + 2, xorin.1);

                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // r
                let r = self.r_src.encode();
                fuse_array.set((x + d * 4) as usize, y + 2, r.0);
                fuse_array.set((x + d * 5) as usize, y + 2, r.1);

                // regmod
                let regmod = self.reg_mode.encode();
                fuse_array.set((x + d * 6) as usize, y + 2, regmod.0);
                fuse_array.set((x + d * 7) as usize, y + 2, regmod.1);

                // skipped RegCom (belongs to IOB)
            },
            XC2Device::XC2C128 | XC2Device::XC2C384 | XC2Device::XC2C512 => {
                // The "common large macrocell" variant
                // we need this funny lookup table, but otherwise macrocells are 2x15
                let y = y + MC_TO_ROW_MAP_LARGE[mc as usize];

                // skipped INz (belongs to IOB)

                // fb
                let fb = self.fb_mode.encode();
                fuse_array.set((x + d * 2) as usize, y + 0, fb.0);
                fuse_array.set((x + d * 3) as usize, y + 0, fb.1);

                // skipped DG (belongs to IOB)
                // skipped InMod (belongs to IOB)
                // skipped Tm (belongs to IOB)

                // aclk
                fuse_array.set((x + d * 8) as usize, y + 0, self.clk_src.encode().0);

                // clk
                let clk = (self.clk_src.encode().1, self.clk_src.encode().2);
                fuse_array.set((x + d * 9) as usize, y + 0, clk.0);
                fuse_array.set((x + d * 10) as usize, y + 0, clk.1);

                // clkfreq
                fuse_array.set((x + d * 11) as usize, y + 0, self.is_ddr);

                // clkop
                fuse_array.set((x + d * 12) as usize, y + 0, self.clk_invert_pol);

                // inreg
                fuse_array.set((x + d * 13) as usize, y + 0, !self.ff_in_ibuf);

                // pu
                fuse_array.set((x + d * 14) as usize, y + 0, !self.init_state);

                // xorin
                let xorin = self.xor_mode.encode();
                fuse_array.set((x + d * 0) as usize, y + 1, xorin.0);
                fuse_array.set((x + d * 1) as usize, y + 1, xorin.1);

                // skipped Oe (belongs to IOB)
                // skipped Slw (belongs to IOB)
                // skipped RegCom (belongs to IOB)

                // regmod
                let regmod = self.reg_mode.encode();
                fuse_array.set((x + d * 9) as usize, y + 1, regmod.0);
                fuse_array.set((x + d * 10) as usize, y + 1, regmod.1);

                // r
                let r = self.r_src.encode();
                fuse_array.set((x + d * 11) as usize, y + 1, r.0);
                fuse_array.set((x + d * 12) as usize, y + 1, r.1);

                // p
                let p = self.s_src.encode();
                fuse_array.set((x + d * 13) as usize, y + 1, p.0);
                fuse_array.set((x + d * 14) as usize, y + 1, p.1);
            }
        }
    }

    /// Reads the crbit representation of this macrocell from the given `fuse_array`.
    pub fn from_crbit(device: XC2Device, fb: u32, mc: u32, fuse_array: &FuseArray) -> Self {
        let (x, y, mirror) = mc_block_loc(device, fb);
        // direction
        let x = x as i32;
        let d = if !mirror {1} else {-1};
        match device {
            XC2Device::XC2C32 | XC2Device::XC2C32A => {
                // The "32" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // aclk
                let aclk = fuse_array.get((x + d * 0) as usize, y + 0);

                // clkop
                let clk_invert_pol = fuse_array.get((x + d * 1) as usize, y + 0);

                // clk
                let clk = (fuse_array.get((x + d * 2) as usize, y + 0),
                           fuse_array.get((x + d * 3) as usize, y + 0));

                // clkfreq
                let is_ddr = fuse_array.get((x + d * 4) as usize, y + 0);

                // r
                let r = (fuse_array.get((x + d * 5) as usize, y + 0),
                         fuse_array.get((x + d * 6) as usize, y + 0));

                // p
                let p = (fuse_array.get((x + d * 7) as usize, y + 0),
                         fuse_array.get((x + d * 8) as usize, y + 0));

                // regmod
                let regmod = (fuse_array.get((x + d * 0) as usize, y + 1),
                              fuse_array.get((x + d * 1) as usize, y + 1));

                // skipped INz (belongs to IOB)

                // fb
                let fb = (fuse_array.get((x + d * 4) as usize, y + 1),
                          fuse_array.get((x + d * 5) as usize, y + 1));

                // inreg
                let ff_in_ibuf = !fuse_array.get((x + d * 6) as usize, y + 1);

                // skipped St (belongs to IOB)

                // xorin
                let xorin = (fuse_array.get((x + d * 8) as usize, y + 1),
                             fuse_array.get((x + d * 0) as usize, y + 2));

                // skipped RegCom (belongs to IOB)
                // skipped Oe (belongs to IOB)
                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // pu
                let init_state = !fuse_array.get((x + d * 8) as usize, y + 2);

                XC2Macrocell {
                    clk_src: XC2MCRegClkSrc::decode((aclk, clk.0, clk.1)),
                    clk_invert_pol,
                    is_ddr,
                    r_src: XC2MCRegResetSrc::decode(r),
                    s_src: XC2MCRegSetSrc::decode(p),
                    init_state,
                    reg_mode: XC2MCRegMode::decode(regmod),
                    fb_mode: XC2MCFeedbackMode::decode(fb),
                    ff_in_ibuf,
                    xor_mode: XC2MCXorMode::decode(xorin),
                }
            },
            XC2Device::XC2C64 | XC2Device::XC2C64A => {
                // The "64" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // aclk
                let aclk = fuse_array.get((x + d * 8) as usize, y + 0);

                // clkop
                let clk_invert_pol = fuse_array.get((x + d * 7) as usize, y + 0);

                // clk
                let clk = (fuse_array.get((x + d * 5) as usize, y + 0),
                           fuse_array.get((x + d * 6) as usize, y + 0));

                // clkfreq
                let is_ddr = fuse_array.get((x + d * 4) as usize, y + 0);

                // r
                let r = (fuse_array.get((x + d * 2) as usize, y + 0),
                         fuse_array.get((x + d * 3) as usize, y + 0));

                // p
                let p = (fuse_array.get((x + d * 0) as usize, y + 0),
                         fuse_array.get((x + d * 1) as usize, y + 0));

                // regmod
                let regmod = (fuse_array.get((x + d * 7) as usize, y + 1),
                              fuse_array.get((x + d * 8) as usize, y + 1));

                // skipped INz (belongs to IOB)

                // fb
                let fb = (fuse_array.get((x + d * 3) as usize, y + 1),
                          fuse_array.get((x + d * 4) as usize, y + 1));

                // inreg
                let ff_in_ibuf = !fuse_array.get((x + d * 2) as usize, y + 1);

                // skipped St (belongs to IOB)

                // xorin
                let xorin = (fuse_array.get((x + d * 7) as usize, y + 2),
                             fuse_array.get((x + d * 8) as usize, y + 2));

                // skipped RegCom (belongs to IOB)
                // skipped Oe (belongs to IOB)
                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // pu
                let init_state = !fuse_array.get((x + d * 0) as usize, y + 2);

                XC2Macrocell {
                    clk_src: XC2MCRegClkSrc::decode((aclk, clk.0, clk.1)),
                    clk_invert_pol,
                    is_ddr,
                    r_src: XC2MCRegResetSrc::decode(r),
                    s_src: XC2MCRegSetSrc::decode(p),
                    init_state,
                    reg_mode: XC2MCRegMode::decode(regmod),
                    fb_mode: XC2MCFeedbackMode::decode(fb),
                    ff_in_ibuf,
                    xor_mode: XC2MCXorMode::decode(xorin),
                }
            },
            XC2Device::XC2C256 => {
                // The "256" variant
                // each macrocell is 3 rows high
                let y = y + (mc as usize) * 3;

                // skipped InMod (belongs to IOB)

                // fb
                let fb = (fuse_array.get((x + d * 2) as usize, y + 0),
                          fuse_array.get((x + d * 3) as usize, y + 0));

                // skipped DG (belongs to IOB)

                // clkop
                let clk_invert_pol = fuse_array.get((x + d * 5) as usize, y + 0);

                // clkfreq
                let is_ddr = fuse_array.get((x + d * 6) as usize, y + 0);

                // clk
                let clk = (fuse_array.get((x + d * 7) as usize, y + 0),
                           fuse_array.get((x + d * 8) as usize, y + 0));

                // aclk
                let aclk = fuse_array.get((x + d * 9) as usize, y + 0);

                // pu
                let init_state = !fuse_array.get((x + d * 0) as usize, y + 1);

                // p
                let p = (fuse_array.get((x + d * 1) as usize, y + 1),
                         fuse_array.get((x + d * 2) as usize, y + 1));

                // skipped Oe (belongs to IOB)
                // skipped INz (belongs to IOB)

                // inreg
                let ff_in_ibuf = !fuse_array.get((x + d * 9) as usize, y + 1);

                // xorin
                let xorin = (fuse_array.get((x + d * 0) as usize, y + 2),
                             fuse_array.get((x + d * 1) as usize, y + 2));

                // skipped Tm (belongs to IOB)
                // skipped Slw (belongs to IOB)

                // r
                let r = (fuse_array.get((x + d * 4) as usize, y + 2),
                         fuse_array.get((x + d * 5) as usize, y + 2));

                // regmod
                let regmod = (fuse_array.get((x + d * 6) as usize, y + 2),
                              fuse_array.get((x + d * 7) as usize, y + 2));

                // skipped RegCom (belongs to IOB)

                XC2Macrocell {
                    clk_src: XC2MCRegClkSrc::decode((aclk, clk.0, clk.1)),
                    clk_invert_pol,
                    is_ddr,
                    r_src: XC2MCRegResetSrc::decode(r),
                    s_src: XC2MCRegSetSrc::decode(p),
                    init_state,
                    reg_mode: XC2MCRegMode::decode(regmod),
                    fb_mode: XC2MCFeedbackMode::decode(fb),
                    ff_in_ibuf,
                    xor_mode: XC2MCXorMode::decode(xorin),
                }
            },
            XC2Device::XC2C128 | XC2Device::XC2C384 | XC2Device::XC2C512 => {
                // The "common large macrocell" variant
                // we need this funny lookup table, but otherwise macrocells are 2x15
                let y = y + MC_TO_ROW_MAP_LARGE[mc as usize];

                // skipped INz (belongs to IOB)

                // fb
                let fb = (fuse_array.get((x + d * 2) as usize, y + 0),
                          fuse_array.get((x + d * 3) as usize, y + 0));

                // skipped DG (belongs to IOB)
                // skipped InMod (belongs to IOB)
                // skipped Tm (belongs to IOB)

                // aclk
                let aclk = fuse_array.get((x + d * 8) as usize, y + 0);

                // clk
                let clk = (fuse_array.get((x + d * 9) as usize, y + 0),
                           fuse_array.get((x + d * 10) as usize, y + 0));

                // clkfreq
                let is_ddr = fuse_array.get((x + d * 11) as usize, y + 0);

                // clkop
                let clk_invert_pol = fuse_array.get((x + d * 12) as usize, y + 0);

                // inreg
                let ff_in_ibuf = !fuse_array.get((x + d * 13) as usize, y + 0);

                // pu
                let init_state = !fuse_array.get((x + d * 14) as usize, y + 0);

                // xorin
                let xorin = (fuse_array.get((x + d * 0) as usize, y + 1),
                             fuse_array.get((x + d * 1) as usize, y + 1));

                // skipped Oe (belongs to IOB)
                // skipped Slw (belongs to IOB)
                // skipped RegCom (belongs to IOB)

                // regmod
                let regmod = (fuse_array.get((x + d * 9) as usize, y + 1),
                              fuse_array.get((x + d * 10) as usize, y + 1));

                // r
                let r = (fuse_array.get((x + d * 11) as usize, y + 1),
                         fuse_array.get((x + d * 12) as usize, y + 1));

                // p
                let p = (fuse_array.get((x + d * 13) as usize, y + 1),
                         fuse_array.get((x + d * 14) as usize, y + 1));

                XC2Macrocell {
                    clk_src: XC2MCRegClkSrc::decode((aclk, clk.0, clk.1)),
                    clk_invert_pol,
                    is_ddr,
                    r_src: XC2MCRegResetSrc::decode(r),
                    s_src: XC2MCRegSetSrc::decode(p),
                    init_state,
                    reg_mode: XC2MCRegMode::decode(regmod),
                    fb_mode: XC2MCFeedbackMode::decode(fb),
                    ff_in_ibuf,
                    xor_mode: XC2MCXorMode::decode(xorin),
                }
            }
        }
    }

    ///  Internal function that reads only the macrocell-related bits from the macrcocell configuration
    pub fn from_jed_small(fuses: &[bool], block_idx: usize, mc_idx: usize) -> Self {
        let aclk = fuses[block_idx + mc_idx * 27 + 0];
        let clk = (fuses[block_idx + mc_idx * 27 + 2],
                   fuses[block_idx + mc_idx * 27 + 3]);

        let clk_src = XC2MCRegClkSrc::decode((aclk, clk.0, clk.1));

        let clkop = fuses[block_idx + mc_idx * 27 + 1];
        let clkfreq = fuses[block_idx + mc_idx * 27 + 4];

        let r = (fuses[block_idx + mc_idx * 27 + 5],
                 fuses[block_idx + mc_idx * 27 + 6]);
        let reset_mode = XC2MCRegResetSrc::decode(r);

        let p = (fuses[block_idx + mc_idx * 27 + 7],
                 fuses[block_idx + mc_idx * 27 + 8]);
        let set_mode = XC2MCRegSetSrc::decode(p);

        let regmod = (fuses[block_idx + mc_idx * 27 + 9],
                      fuses[block_idx + mc_idx * 27 + 10]);
        let reg_mode = XC2MCRegMode::decode(regmod);

        let fb = (fuses[block_idx + mc_idx * 27 + 13],
                  fuses[block_idx + mc_idx * 27 + 14]);
        let fb_mode = XC2MCFeedbackMode::decode(fb);

        let inreg = fuses[block_idx + mc_idx * 27 + 15];

        let xorin = (fuses[block_idx + mc_idx * 27 + 17],
                     fuses[block_idx + mc_idx * 27 + 18]);
        let xormode = XC2MCXorMode::decode(xorin);

        let pu = fuses[block_idx + mc_idx * 27 + 26];

        XC2Macrocell {
            clk_src,
            clk_invert_pol: clkop,
            is_ddr: clkfreq,
            r_src: reset_mode,
            s_src: set_mode,
            init_state: !pu,
            reg_mode,
            fb_mode,
            ff_in_ibuf: !inreg,
            xor_mode: xormode,
        }
    }

    ///  Internal function that reads only the macrocell-related bits from the macrcocell configuration
    pub fn from_jed_large(fuses: &[bool], fuse_idx: usize) -> Self {
        let aclk = fuses[fuse_idx + 0];

        let clk = (fuses[fuse_idx + 1],
                   fuses[fuse_idx + 2]);

        let clk_src = XC2MCRegClkSrc::decode((aclk, clk.0, clk.1));

        let clkfreq = fuses[fuse_idx + 3];
        let clkop = fuses[fuse_idx + 4];

        let fb = (fuses[fuse_idx + 6],
                  fuses[fuse_idx + 7]);
        let fb_mode = XC2MCFeedbackMode::decode(fb);

        let inreg = fuses[fuse_idx + 10];

        let p = (fuses[fuse_idx + 17],
                 fuses[fuse_idx + 18]);
        let set_mode = XC2MCRegSetSrc::decode(p);

        let pu = fuses[fuse_idx + 19];

        let regmod = (fuses[fuse_idx + 21],
                      fuses[fuse_idx + 22]);
        let reg_mode = XC2MCRegMode::decode(regmod);

        let r = (fuses[fuse_idx + 23],
                 fuses[fuse_idx + 24]);
        let reset_mode = XC2MCRegResetSrc::decode(r);

        let xorin = (fuses[fuse_idx + 27],
                     fuses[fuse_idx + 28]);
        let xormode = XC2MCXorMode::decode(xorin);

        XC2Macrocell {
            clk_src,
            clk_invert_pol: clkop,
            is_ddr: clkfreq,
            r_src: reset_mode,
            s_src: set_mode,
            init_state: !pu,
            reg_mode,
            fb_mode,
            ff_in_ibuf: !inreg,
            xor_mode: xormode,
        }
    }

    ///  Internal function that reads only the macrocell-related bits from the macrcocell configuration
    pub fn from_jed_large_buried(fuses: &[bool], fuse_idx: usize) -> Self {
        let aclk = fuses[fuse_idx + 0];

        let clk = (fuses[fuse_idx + 1],
                   fuses[fuse_idx + 2]);

        let clk_src = XC2MCRegClkSrc::decode((aclk, clk.0, clk.1));

        let clkfreq = fuses[fuse_idx + 3];
        let clkop = fuses[fuse_idx + 4];

        let fb = (fuses[fuse_idx + 5],
                  fuses[fuse_idx + 6]);
        let fb_mode = XC2MCFeedbackMode::decode(fb);

        let p = (fuses[fuse_idx + 7],
                 fuses[fuse_idx + 8]);
        let set_mode = XC2MCRegSetSrc::decode(p);

        let pu = fuses[fuse_idx + 9];

        let regmod = (fuses[fuse_idx + 10],
                      fuses[fuse_idx + 11]);
        let reg_mode = XC2MCRegMode::decode(regmod);

        let r = (fuses[fuse_idx + 12],
                 fuses[fuse_idx + 13]);
        let reset_mode = XC2MCRegResetSrc::decode(r);

        let xorin = (fuses[fuse_idx + 14],
                     fuses[fuse_idx + 15]);
        let xormode = XC2MCXorMode::decode(xorin);

        XC2Macrocell {
            clk_src,
            clk_invert_pol: clkop,
            is_ddr: clkfreq,
            r_src: reset_mode,
            s_src: set_mode,
            init_state: !pu,
            reg_mode,
            fb_mode,
            ff_in_ibuf: false,
            xor_mode: xormode,
        }
    }

    /// Helper that prints the IOB and macrocell configuration on the "small" parts
    pub fn to_jed_small(jed: &mut JEDECFile, linebreaks: &mut LinebreakSet,
        device: XC2Device, fb: &XC2BitstreamFB, iobs: &[XC2MCSmallIOB], fb_i: usize, fuse_base: usize) {

        let zia_row_width = zia_get_row_width(device);

        for i in 0..MCS_PER_FB {
            let mc_fuse_base = fuse_base + zia_row_width * INPUTS_PER_ANDTERM +
                ANDTERMS_PER_FB * INPUTS_PER_ANDTERM * 2 + ANDTERMS_PER_FB * MCS_PER_FB + i * 27;
                
            linebreaks.add(mc_fuse_base);
            if i == 0 {
                linebreaks.add(mc_fuse_base);
            }

            let iob = fb_mc_num_to_iob_num(device, fb_i as u32, i as u32).unwrap() as usize;

            // aclk
            jed.f[mc_fuse_base +  0] = fb.mcs[i].clk_src.encode().0;

            // clkop
            jed.f[mc_fuse_base +  1] = fb.mcs[i].clk_invert_pol;

            // clk
            let clk = (fb.mcs[i].clk_src.encode().1, fb.mcs[i].clk_src.encode().2);
            jed.f[mc_fuse_base +  2] = clk.0;
            jed.f[mc_fuse_base +  3] = clk.1;

            // clkfreq
            jed.f[mc_fuse_base +  4] = fb.mcs[i].is_ddr;

            // r
            let r = fb.mcs[i].r_src.encode();
            jed.f[mc_fuse_base +  5] = r.0;
            jed.f[mc_fuse_base +  6] = r.1;

            // p
            let p = fb.mcs[i].s_src.encode();
            jed.f[mc_fuse_base +  7] = p.0;
            jed.f[mc_fuse_base +  8] = p.1;

            // regmod
            let regmod = fb.mcs[i].reg_mode.encode();
            jed.f[mc_fuse_base +  9] = regmod.0;
            jed.f[mc_fuse_base + 10] = regmod.1;

            // fb
            let fb_bits = fb.mcs[i].fb_mode.encode();
            jed.f[mc_fuse_base + 13] = fb_bits.0;
            jed.f[mc_fuse_base + 14] = fb_bits.1;

            // inreg
            jed.f[mc_fuse_base + 15] = !fb.mcs[i].ff_in_ibuf;

            // xorin
            let xorin = fb.mcs[i].xor_mode.encode();
            jed.f[mc_fuse_base + 17] = xorin.0;
            jed.f[mc_fuse_base + 18] = xorin.1;

            // pu
            jed.f[mc_fuse_base + 26] = !fb.mcs[i].init_state;

            iobs[iob].encode_jed_internal(&mut jed.f, mc_fuse_base);
        }
    }

    /// Helper that prints the IOB and macrocell configuration on the "large" parts
    pub fn to_jed_large(jed: &mut JEDECFile, linebreaks: &mut LinebreakSet,
        device: XC2Device, fb: &XC2BitstreamFB, iobs: &[XC2MCLargeIOB], fb_i: usize, fuse_base: usize) {

        let zia_row_width = zia_get_row_width(device);

        let mut current_fuse_offset = fuse_base + zia_row_width * INPUTS_PER_ANDTERM +
            ANDTERMS_PER_FB * INPUTS_PER_ANDTERM * 2 + ANDTERMS_PER_FB * MCS_PER_FB;

        linebreaks.add(current_fuse_offset);

        for i in 0..MCS_PER_FB {
            linebreaks.add(current_fuse_offset);

            let iob = fb_mc_num_to_iob_num(device, fb_i as u32, i as u32);

            // aclk
            jed.f[current_fuse_offset] = fb.mcs[i].clk_src.encode().0;
            current_fuse_offset += 1;

            // clk
            let clk = (fb.mcs[i].clk_src.encode().1, fb.mcs[i].clk_src.encode().2);
            jed.f[current_fuse_offset + 0] = clk.0;
            jed.f[current_fuse_offset + 1] = clk.1;
            current_fuse_offset += 2;

            // clkfreq
            jed.f[current_fuse_offset] = fb.mcs[i].is_ddr;
            current_fuse_offset += 1;

            // clkop
            jed.f[current_fuse_offset] = fb.mcs[i].clk_invert_pol;
            current_fuse_offset += 1;

            if iob.is_some() {
                // dg
                jed.f[current_fuse_offset] = iobs[iob.unwrap() as usize].uses_data_gate;
                current_fuse_offset += 1;
            }

            // fb
            let fb_bits = fb.mcs[i].fb_mode.encode();
            jed.f[current_fuse_offset + 0] = fb_bits.0;
            jed.f[current_fuse_offset + 1] = fb_bits.1;
            current_fuse_offset += 2;

            if iob.is_some() {
                let iob = iob.unwrap() as usize;

                // inmod
                let inmod = iobs[iob].ibuf_mode.encode();
                jed.f[current_fuse_offset + 0] = inmod.0;
                jed.f[current_fuse_offset + 1] = inmod.1;
                current_fuse_offset += 2;

                // inreg
                jed.f[current_fuse_offset] = !fb.mcs[i].ff_in_ibuf;
                current_fuse_offset += 1;

                // inz
                let inz = iobs[iob].zia_mode.encode();
                jed.f[current_fuse_offset + 0] = inz.0;
                jed.f[current_fuse_offset + 1] = inz.1;
                current_fuse_offset += 2;

                // oe
                let oe = iobs[iob].obuf_mode.encode();
                jed.f[current_fuse_offset + 0] = oe.0;
                jed.f[current_fuse_offset + 1] = oe.1;
                jed.f[current_fuse_offset + 2] = oe.2;
                jed.f[current_fuse_offset + 3] = oe.3;
                current_fuse_offset += 4;
            }

            // p
            let p = fb.mcs[i].s_src.encode();
            jed.f[current_fuse_offset + 0] = p.0;
            jed.f[current_fuse_offset + 1] = p.1;
            current_fuse_offset += 2;

            // pu
            jed.f[current_fuse_offset] = !fb.mcs[i].init_state;
            current_fuse_offset += 1;

            if iob.is_some() {
                // regcom
                jed.f[current_fuse_offset] = !iobs[iob.unwrap() as usize].obuf_uses_ff;
                current_fuse_offset += 1;
            }

            // regmod
            let regmod = fb.mcs[i].reg_mode.encode();
            jed.f[current_fuse_offset + 0] = regmod.0;
            jed.f[current_fuse_offset + 1] = regmod.1;
            current_fuse_offset += 2;

            // r
            let r = fb.mcs[i].r_src.encode();
            jed.f[current_fuse_offset + 0] = r.0;
            jed.f[current_fuse_offset + 1] = r.1;
            current_fuse_offset += 2;

            if iob.is_some() {
                let iob = iob.unwrap() as usize;

                // slw
                jed.f[current_fuse_offset] = !iobs[iob].slew_is_fast;
                current_fuse_offset += 1;

                // tm
                jed.f[current_fuse_offset] = iobs[iob].termination_enabled;
                current_fuse_offset += 1;
            }

            // xorin
            let xorin = fb.mcs[i].xor_mode.encode();
            jed.f[current_fuse_offset + 0] = xorin.0;
            jed.f[current_fuse_offset + 1] = xorin.1;
            current_fuse_offset += 2;
        }
    }
}
