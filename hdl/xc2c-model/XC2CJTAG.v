`default_nettype none
/***********************************************************************************************************************
 * Copyright (C) 2016-2017 Andrew Zonenberg and contributors                                                           *
 *                                                                                                                     *
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General   *
 * Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) *
 * any later version.                                                                                                  *
 *                                                                                                                     *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied  *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for     *
 * more details.                                                                                                       *
 *                                                                                                                     *
 * You should have received a copy of the GNU Lesser General Public License along with this program; if not, you may   *
 * find one here:                                                                                                      *
 * https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt                                                              *
 * or you may search the http://www.gnu.org website for the version 2.1 license, or you may write to the Free Software *
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA                                      *
 **********************************************************************************************************************/

/**
	@brief JTAG stuff for an XC2C-series device
 */
module XC2CJTAG(
	tdi, tms, tck, tdo,
	config_erase,
	config_read_en, config_read_addr, config_read_data,
	config_write_en, config_write_addr, config_write_data,
	config_done, config_done_rst);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Device configuration

	parameter MACROCELLS = 32;		//A variant implied for 32/64, no support for base version

	parameter PACKAGE = "QFG32";	//Package code (lead-free G assumed)

	parameter SHREG_WIDTH = 1;		//ISC shift register width

	parameter ADDR_BITS = 1;		//Bits in ISC address shift register

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// I/Os

	input wire					tdi;
	input wire					tms;
	input wire					tck;
	output reg					tdo;

	//Status signals to the configuration memory
	output reg					config_erase		= 0;	//Erases all config memory
															//This takes 100 ms IRL but for now we'll model it instantly

	output reg					config_read_en		= 0;
	output reg[ADDR_BITS-1:0]	config_read_addr	= 0;	//Address for reading the bitstream (real, not gray code)
	input wire[SHREG_WIDTH-1:0]	config_read_data;

	output reg					config_write_en		= 0;
	output reg[ADDR_BITS-1:0]	config_write_addr	= 0;
	output reg[SHREG_WIDTH-1:0]	config_write_data	= 0;

	output wire					config_done;
	output reg					config_done_rst		= 0;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The core JTAG state machine

	localparam STATE_TEST_LOGIC_RESET	= 4'h0;
	localparam STATE_RUN_TEST_IDLE		= 4'h1;
	localparam STATE_SELECT_DR_SCAN		= 4'h2;
	localparam STATE_SELECT_IR_SCAN		= 4'h3;
	localparam STATE_CAPTURE_DR			= 4'h4;
	localparam STATE_CAPTURE_IR			= 4'h5;
	localparam STATE_SHIFT_DR			= 4'h6;
	localparam STATE_SHIFT_IR			= 4'h7;
	localparam STATE_EXIT1_DR			= 4'h8;
	localparam STATE_EXIT1_IR			= 4'h9;
	localparam STATE_PAUSE_DR			= 4'ha;
	localparam STATE_PAUSE_IR			= 4'hb;
	localparam STATE_EXIT2_DR			= 4'hc;
	localparam STATE_EXIT2_IR			= 4'hd;
	localparam STATE_UPDATE_DR			= 4'he;
	localparam STATE_UPDATE_IR			= 4'hf;

	reg[3:0] state						= STATE_TEST_LOGIC_RESET;

	always @(posedge tck) begin

		case(state)

			STATE_TEST_LOGIC_RESET: begin
				if(!tms)
					state			<= STATE_RUN_TEST_IDLE;
			end	//end STATE_TEST_LOGIC_RESET

			STATE_RUN_TEST_IDLE: begin
				if(tms)
					state			<= STATE_SELECT_DR_SCAN;
			end	//end STATE_RUN_TEST_IDLE

			STATE_SELECT_DR_SCAN: begin
				if(tms)
					state			<= STATE_SELECT_IR_SCAN;
				else
					state			<= STATE_CAPTURE_DR;
			end	//end STATE_SELECT_DR_SCAN

			STATE_SELECT_IR_SCAN: begin
				if(tms)
					state			<= STATE_TEST_LOGIC_RESET;
				else
					state			<= STATE_CAPTURE_IR;
			end	//end STATE_SELECT_IR_SCAN

			STATE_CAPTURE_DR: begin
				if(tms)
					state			<= STATE_EXIT1_DR;
				else
					state			<= STATE_SHIFT_DR;
			end	//end STATE_CAPTURE_DR

			STATE_CAPTURE_IR: begin
				if(tms)
					state			<= STATE_EXIT1_IR;
				else
					state			<= STATE_SHIFT_IR;
			end	//end STATE_CAPTURE_IR

			STATE_SHIFT_DR: begin
				if(tms)
					state			<= STATE_EXIT1_DR;
			end	//end STATE_SHIFT_DR

			STATE_SHIFT_IR: begin
				if(tms)
					state			<= STATE_EXIT1_IR;
			end	//end STATE_SHIFT_IR

			STATE_EXIT1_DR: begin
				if(tms)
					state			<= STATE_UPDATE_DR;
				else
					state			<= STATE_PAUSE_DR;
			end	//end STATE_EXIT1_DR

			STATE_EXIT1_IR: begin
				if(tms)
					state			<= STATE_UPDATE_IR;
				else
					state			<= STATE_PAUSE_IR;
			end	//end STATE_EXIT1_IR

			STATE_PAUSE_DR: begin
				if(tms)
					state			<= STATE_EXIT2_DR;
			end	//end STATE_PAUSE_DR

			STATE_PAUSE_IR: begin
				if(tms)
					state			<= STATE_EXIT2_IR;
			end	//end STATE_PAUSE_IR

			STATE_EXIT2_DR: begin
				if(tms)
					state			<= STATE_UPDATE_DR;
				else
					state			<= STATE_SHIFT_DR;
			end	//end STATE_EXIT2_DR

			STATE_EXIT2_IR: begin
				if(tms)
					state			<= STATE_UPDATE_IR;
				else
					state			<= STATE_SHIFT_IR;
			end	//end STATE_EXIT2_IR

			STATE_UPDATE_DR: begin
				if(tms)
					state			<= STATE_SELECT_DR_SCAN;
				else
					state			<= STATE_RUN_TEST_IDLE;
			end	//end STATE_UPDATE_DR

			STATE_UPDATE_IR: begin
				if(tms)
					state			<= STATE_SELECT_IR_SCAN;
				else
					state			<= STATE_RUN_TEST_IDLE;
			end	//end STATE_UPDATE_IR

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Device configuration states

	reg			isc_enabled				= 0;
	reg			isc_disabled			= 0;
	reg			configured				= 0;
	reg			read_locked				= 0;

	assign		config_done = configured;

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The instruction register

	//see XC2C programmer qualification spec v1.3 p25-26
	localparam INST_EXTEST				= 8'h00;
	localparam INST_IDCODE				= 8'h01;
	localparam INST_INTEST				= 8'h02;
	localparam INST_SAMPLE_PRELOAD		= 8'h03;
	localparam INST_TEST_ENABLE			= 8'h11;	//Private1, got this info from BSDL
	localparam INST_BULKPROG			= 8'h12;	//Private2, got this info from BSDL
													//Guessing this programs the IDCODE memory etc
	localparam INST_MVERIFY				= 8'h13;	//Private3, got this info from BSDL
													//Guessing this is a full read including IDCODE.
													//May bypass protection?
	localparam INST_ERASE_ALL			= 8'h14;	//Private4, got this info from BSDL
													//Probably wipes IDCODE too
	localparam INST_TEST_DISABLE		= 8'h15;	//Private5, got this info from BSDL
	localparam INST_STCTEST				= 8'h16;	//Private6, got this info from BSDL.
													//Note, it was commented out there! Wonder why...
	localparam INST_ISC_DISABLE			= 8'hc0;
	localparam INST_ISC_NOOP			= 8'he0;
	localparam INST_ISC_ENABLEOTF		= 8'he4;
	localparam INST_ISC_SRAM_WRITE		= 8'he6;
	localparam INST_ISC_SRAM_READ		= 8'he7;
	localparam INST_ISC_ENABLE			= 8'he8;
	localparam INST_ISC_ENABLE_CLAMP	= 8'he9;
	localparam INST_ISC_PROGRAM			= 8'hea;
	localparam INST_ISC_ERASE			= 8'hed;
	localparam INST_ISC_READ			= 8'hee;
	localparam INST_ISC_INIT			= 8'hf0;
	localparam INST_CLAMP				= 8'hfa;
	localparam INST_HIGHZ				= 8'hfc;
	localparam INST_USERCODE			= 8'hfd;
	localparam INST_BYPASS				= 8'hff;

	reg[7:0] ir			= INST_IDCODE;
	reg[7:0] ir_shreg	= 0;
	reg	programming		= 0;

	//Instruction loading and capture
	always @(posedge tck) begin

		config_erase			<= 0;
		config_done_rst			<= 0;

		case(state)

			//Reset instruction to IDCODE upon reset
			STATE_TEST_LOGIC_RESET: begin
				ir				<= INST_IDCODE;
			end	//end STATE_TEST_LOGIC_RESET

			//Instruction capture, per XC2C programming spec figure 12 (p. 21)
			STATE_CAPTURE_IR: begin
				ir_shreg[7:6]	<= 2'b00;
				ir_shreg[5]		<= isc_disabled;
				ir_shreg[4]		<= isc_enabled;
				ir_shreg[3]		<= read_locked;
				ir_shreg[2]		<= configured;
				ir_shreg[1:0]	<= 2'b01;
			end	//end STATE_CAPTURE_IR

			//Loading a new IR
			STATE_SHIFT_IR: begin
				ir_shreg		<= {tdi, ir_shreg[7:1]};
			end	//end STATE_SHIFT_IR

			//Done, save the new IR
			STATE_UPDATE_IR: begin
				ir					<= ir_shreg;

				//If we're entering/exiting ISC mode, set the ISC bits appropriately
				//TODO: support OTF mode
				if(ir_shreg == INST_ISC_ENABLE)
					isc_enabled		<= 1;
				if(ir_shreg == INST_ISC_DISABLE) begin
					programming		<= 0;
					isc_enabled		<= 0;
				end

				//Wipe config memory when we get an ERASE instruction
				if(ir_shreg == INST_ISC_ERASE) begin
					config_erase	<= 1;
					configured		<= 0;
				end

				//Declare us to be programming when we load ISC_PROGRAM
				//TODO: check DONE / transfer bits first
				if(ir_shreg == INST_ISC_PROGRAM) begin
					programming		<= 1;
				end

				//If we leave programming mode after programming, set us to be done and reset everything
				if(ir_shreg == INST_ISC_DISABLE && programming) begin
					configured		<= 1;
					config_done_rst <= 1;
					`ifdef XILINX_ISIM
						$display("Configuration complete");
					`endif
				end

				//TODO: copy EEPROM to RAM when we get an ISC_INIT command

			end	//end STATE_UPDATE_IR

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// BYPASS DR

	reg		bypass_shreg	= 0;

	always @(posedge tck) begin

		case(state)
			STATE_SHIFT_DR: begin
				bypass_shreg	<= tdi;
			end	//end STATE_SHIFT_DR
		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// IDCODE DR

	reg[31:0] idcode;
	initial begin
		idcode[31:28]	<= 4'hf;	//stepping 0xF, this hopefully doesn't exist IRL
		idcode[27:25]	<= 3'h3;	//CoolRunner-II
		idcode[24:22]	<= 3'h3;	//CoolRunner-II

		//Macrocell count
		case(MACROCELLS)
			32:	idcode[21:16]		<= 6'h21;	//01 = xc2c32, not supported
			64: idcode[21:16]		<= 6'h25;	//05 = xc2c64, not supported
			128: idcode[21:16]		<= 6'h18;
			256: idcode[21:16]		<= 6'h14;
			384: idcode[21:16]		<= 6'h15;
			512: idcode[21:16]		<= 6'h17;
			default: idcode[21:16]	<= 0;
		endcase

		idcode[15]		<= 1'h1;	//always 1

		//Package identifier
		case(MACROCELLS)
			32: begin
				if(PACKAGE == "QFG32")
					idcode[14:12]	<= 3'h1;
				else if(PACKAGE == "CPG56")
					idcode[14:12]	<= 3'h3;
				else if(PACKAGE == "VQG44")
					idcode[14:12]	<= 3'h4;
				else begin
					$display("Invalid package %s for 32 macrocells", PACKAGE);
					$finish;
				end
			end

			64: begin
				if(PACKAGE == "VQG44")
					idcode[14:12]	<= 3'h6;
				else if(PACKAGE == "QFG48")
					idcode[14:12]	<= 3'h1;
				else if(PACKAGE == "CPG56")
					idcode[14:12]	<= 3'h5;
				else if(PACKAGE == "VQG100")
					idcode[14:12]	<= 3'h4;
				else if(PACKAGE == "CPG132")
					idcode[14:12]	<= 3'h3;
				else begin
					$display("Invalid package %s for 64 macrocells", PACKAGE);
					$finish;
				end
			end

			128: begin
				if(PACKAGE == "VQG100")
					idcode[14:12]	<= 3'h2;
				else if(PACKAGE == "CPG132")
					idcode[14:12]	<= 3'h3;
				else if(PACKAGE == "TQG144")
					idcode[14:12]	<= 3'h4;
				else if(PACKAGE == "FTG256")
					idcode[14:12]	<= 3'h6;
				else begin
					$display("Invalid package %s for 128 macrocells", PACKAGE);
					$finish;
				end
			end

			256: begin
				if(PACKAGE == "VQG100")
					idcode[14:12]	<= 3'h2;
				else if(PACKAGE == "CPG132")
					idcode[14:12]	<= 3'h3;
				else if(PACKAGE == "TQG144")
					idcode[14:12]	<= 3'h4;
				else if(PACKAGE == "PQG208")
					idcode[14:12]	<= 3'h5;
				else if(PACKAGE == "FTG256")
					idcode[14:12]	<= 3'h6;
				else begin
					$display("Invalid package %s for 256 macrocells", PACKAGE);
					$finish;
				end
			end

			384: begin
				if(PACKAGE == "TQG144")
					idcode[14:12]	<= 3'h4;
				else if(PACKAGE == "PQG208")
					idcode[14:12]	<= 3'h5;
				else if(PACKAGE == "FTG256")
					idcode[14:12]	<= 3'h7;
				else if(PACKAGE == "FGG324")
					idcode[14:12]	<= 3'h2;
				else begin
					$display("Invalid package %s for 384 macrocells", PACKAGE);
					$finish;
				end
			end

			512: begin
				if(PACKAGE == "PQG208")
					idcode[14:12]	<= 3'h4;
				else if(PACKAGE == "FTG256")
					idcode[14:12]	<= 3'h6;
				else if(PACKAGE == "FGG324")
					idcode[14:12]	<= 3'h2;
				else begin
					$display("Invalid package %s for 512 macrocells", PACKAGE);
					$finish;
				end
			end

			default: begin
				$display("Don't have package IDs coded up for other densities yet\n");
				$finish;
			end
		endcase

		idcode[11:0]	<= 12'h093;	//Xilinx vendor code

	end

	reg[31:0] idcode_shreg = 0;

	always @(posedge tck) begin

		case(state)

			//IDCODE capture
			STATE_CAPTURE_DR: begin
				idcode_shreg <= idcode;
			end	//end STATE_CAPTURE_DR

			//Read the IDCODE
			STATE_SHIFT_DR: begin
				idcode_shreg		<= {tdi, idcode_shreg[31:1]};
			end	//end STATE_SHIFT_DR

			//no update, writes to IDCODE are ignored

		endcase

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Gray code decode ROM

	reg[7:0] gray_to_bin[255:0];

	integer i;
	initial begin
		for(i=0; i<256; i=i+1)
			gray_to_bin[i ^ (i >> 1)]	<= i[7:0];
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Config memory read

	reg[SHREG_WIDTH-1:0] 	isc_read_shreg	= 0;

	//New value for the read shreg
	wire[SHREG_WIDTH-1:0]	isc_read_shreg_adv = {tdi, isc_read_shreg[SHREG_WIDTH-1:1]};

	//Gray coded read address: left N bits of the shift register
	wire[ADDR_BITS-1:0]		isc_read_addr_gray	= isc_read_shreg[SHREG_WIDTH-1 : SHREG_WIDTH-ADDR_BITS];

	//Invert the bit ordering of the address since the protocol is weird and has MSB at right
	reg[ADDR_BITS-1:0]		isc_read_addr_gray_flipped;
	always @(*) begin
		for(i=0; i<ADDR_BITS; i=i+1)
			isc_read_addr_gray_flipped[i]	<= isc_read_addr_gray[ADDR_BITS - 1 - i];
	end

	reg	config_read_real = 0;
	always @(posedge tck) begin

		config_read_en	<= 0;

		if(ir == INST_ISC_READ) begin
			case(state)

				//Load the data that we read
				STATE_CAPTURE_DR: begin
					isc_read_shreg		<= config_read_data;
				end	//end STATE_CAPTURE_DR

				//Actual readout happens here
				STATE_SHIFT_DR: begin
					isc_read_shreg		<= isc_read_shreg_adv;
				end	//end STATE_SHIFT_DR

				//Update: save the de-Gray-ified read address
				STATE_UPDATE_DR: begin
					config_read_en		<= 1;
					config_read_addr	<= gray_to_bin[isc_read_addr_gray_flipped][ADDR_BITS-1:0];
				end	//end STATE_UPDATE_DR

			endcase
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Config memory writes

	localparam WRITE_WIDTH = SHREG_WIDTH + ADDR_BITS;
	reg[WRITE_WIDTH - 1 : 0] isc_write_shreg	= 0;

	//Gray coded write address: left N bits of the shift register
	wire[ADDR_BITS-1:0]		isc_write_addr_gray	= isc_write_shreg[SHREG_WIDTH +: ADDR_BITS];

	//Invert the bit ordering of the address since the protocol is weird and has MSB at right
	reg[ADDR_BITS-1:0]		isc_write_addr_gray_flipped;
	always @(*) begin
		for(i=0; i<ADDR_BITS; i=i+1)
			isc_write_addr_gray_flipped[i]	<= isc_write_addr_gray[ADDR_BITS - 1 - i];
	end

	always @(posedge tck) begin

		config_write_en	<= 0;

		if(ir == INST_ISC_PROGRAM) begin
			case(state)

				//Capture data is ignored
				STATE_CAPTURE_DR: begin
					isc_write_shreg		<= 0;
				end	//end STATE_CAPTURE_DR

				//Read the new bitstream
				STATE_SHIFT_DR: begin
					isc_write_shreg		<= {tdi, isc_write_shreg[WRITE_WIDTH - 1 : 1]};
				end	//end STATE_SHIFT_DR

				//Update: commit the write to bitstream
				STATE_UPDATE_DR: begin
					config_write_en		<= 1;
					config_write_addr	<= gray_to_bin[isc_write_addr_gray_flipped][ADDR_BITS-1:0];
					config_write_data	<= isc_write_shreg[SHREG_WIDTH-1 : 0];
				end	//end STATE_UPDATE_DR

			endcase
		end

	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// TDO muxing

	always @(*) begin

		tdo <= 0;

		//IR stuff
		if(state == STATE_SHIFT_IR)
			tdo		<= ir_shreg[0];

		//DR stuff
		else if(state == STATE_SHIFT_DR) begin
			case(ir)
				INST_BYPASS:		tdo <= bypass_shreg;
				INST_IDCODE:		tdo <= idcode_shreg[0];
				INST_ISC_READ:		tdo <= isc_read_shreg[0];
				INST_ISC_PROGRAM:	tdo	<= isc_write_shreg[0];
			endcase
		end

	end

endmodule
