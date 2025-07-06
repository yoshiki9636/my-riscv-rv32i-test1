/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module ttihp25b-tt_um_yoshiki9636_my-riscv-rv32i (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire [2:0] rgb_led;
wire [2:0] rgb_led1;
wire tx;
wire rx = ui_in[0];
wire interrupt_0 = ui_in[1];

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  =  { 1'b0, rgb_led1, rgb_led, tx };
  assign uio_out = 0;
  assign uio_oe  = 0;


fpga_top fpga_top (
        .clkin(clk),
        .rst_n(rst_n),
        .rx(rx),
        .tx(tx),
        .interrupt_0(interrupt_0),
        .rgb_led(rgb_led),
        .rgb_led1(rgb_led1),
        .rgb_led2(),
        .rgb_led3()
    );


  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
