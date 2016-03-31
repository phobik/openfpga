/***********************************************************************************************************************
 * Copyright (C) 2016 Andrew Zonenberg and contributors                                                                *
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

`default_nettype none

module Blinky(
	out_lfosc_ff, out_lfosc_count, out_lfosc_count2,
	sys_rst, count_rst);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// I/O declarations
	
	(* LOC = "P20" *)
	output reg out_lfosc_ff = 0;
	
	(* LOC = "P19" *)
	output reg out_lfosc_count = 0;
	
	(* LOC = "P4" *)
	output reg out_lfosc_count2 = 0;
	
	(* LOC = "P2" *)
	(* PULLDOWN = "10k" *)
	(* SCHMITT_TRIGGER *)
	input wire sys_rst;
	
	(* LOC = "P3" *)
	(* PULLDOWN = "10k" *)
	(* SCHMITT_TRIGGER *)
	input wire count_rst;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// System reset

	//Level-triggered asynchronous system reset
	GP_SYSRESET #(
		.RESET_MODE("LEVEL")
	) reset_ctrl (
		.RST(sys_rst)
	);

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Oscillators
	
	//The 1730 Hz oscillator
	wire clk_108hz;
	GP_LFOSC #(
		.PWRDN_EN(0),
		.AUTO_PWRDN(0),
		.OUT_DIV(16)
	) lfosc (
		.PWRDN(1'b0),
		.CLKOUT(clk_108hz)
	);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Detect rising edges on count_rst and synchronize to clk_108hz domain
		
	reg rst_ff = 0;
	reg rst_ff2 = 0;
	
	always @(posedge clk_108hz) begin
		rst_ff	<= count_rst;
		rst_ff2	<= rst_ff;
	end
	
	wire count_rst_edge = (rst_ff && !rst_ff2);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Counter configuration
	
	localparam COUNT_MAX = 7;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// LED driven by low-frequency oscillator and post-divider in flipflops

	//Fabric post-divider
	reg[2:0] count = COUNT_MAX;
	always @(posedge clk_108hz) begin
		
		//actual counter
		count		<= count - 1'd1;
		if(count == 0)
			count	<= COUNT_MAX;
			
		/*
		//sync reset
		if(count_rst_edge)
			count	<= 0;
		*/
	end
	
	//Toggle the output every time the counter underflows
	always @(posedge clk_108hz) begin
		if(count == 0)
			out_lfosc_ff	<= ~out_lfosc_ff;
	end

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// LED driven by low-frequency oscillator and post-divider in hard counter on right side of device
	
	//Hard IP post-divider
	wire out_lfosc_raw;
	GP_COUNT8 #(
		.RESET_MODE("RISING"),
		.COUNT_TO(COUNT_MAX),
		.CLKIN_DIVIDE(1)
	) hard_counter (
		.CLK(clk_108hz),
		.RST(count_rst_edge),
		.OUT(out_lfosc_raw)
	);
	
	//Toggle the output every time the counter underflows
	always @(posedge clk_108hz) begin
		if(out_lfosc_raw)
			out_lfosc_count <= ~out_lfosc_count;
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// LED driven by low-frequency oscillator and post-divider in hard counter on left side of device
	
	//Hard IP post-divider
	wire out_lfosc_raw2;
	GP_COUNT8 #(
		.RESET_MODE("RISING"),
		.COUNT_TO(COUNT_MAX),
		.CLKIN_DIVIDE(1)
	) hard_counter2 (
		.CLK(clk_108hz),
		.RST(count_rst_edge),
		.OUT(out_lfosc_raw2)
	);
	
	//Toggle the output every time the counter underflows
	always @(posedge clk_108hz) begin
		if(out_lfosc_raw2)
			out_lfosc_count2 <= ~out_lfosc_count2;
	end

endmodule
