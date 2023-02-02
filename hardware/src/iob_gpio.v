`timescale 1ns/1ps

`include "iob_lib.vh"
`include "iob_gpio_swreg_def.vh"

module iob_gpio 
  # (
     parameter DATA_W = 32, //PARAM CPU data width
     parameter ADDR_W = `iob_gpio_swreg_ADDR_W //MACRO CPU address section width
     )
   (

   //CPU interface
`include "iob_s_if.vh"

    input [15:0] gpio_sw,
    output [7:0] gpio_sseg_ca,
    output [7:0] gpio_sseg_an,
    	
`include "iob_gen_if.vh"
    );

//BLOCK Register File & Configuration control and status register file.
`include "iob_gpio_swreg_gen.vh"

	// 7 Segment display
    `IOB_WIRE(GPIO_SSEG_CA, 8)
    iob_reg #(.DATA_W(8))
    gpio_sseg_ca_reg      (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_SSEG_CA_en),
        .data_in    (GPIO_SSEG_CA_wdata),
        .data_out   (GPIO_SSEG_CA)
    );
    
    `IOB_WIRE(GPIO_SSEG_AN, 8)
    iob_reg #(.DATA_W(8))
    gpio_sseg_an_reg      (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_SSEG_AN_en),
        .data_in    (GPIO_SSEG_AN_wdata),
        .data_out   (GPIO_SSEG_AN)
    );

   // Read SW
   assign GPIO_SW_rdata = gpio_sw;

   // Write LEDS 
   assign gpio_sseg_ca = GPIO_SSEG_CA;
   assign gpio_sseg_an = GPIO_SSEG_AN;
   
   
   


endmodule
