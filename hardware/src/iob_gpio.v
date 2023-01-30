`timescale 1ns/1ps

`include "iob_lib.vh"
`include "iob_gpio_swreg_def.vh"

module iob_gpio 
  # (
     parameter GPIO_W = 32, //PARAM Number of GPIO (can be up to DATA_W)
     parameter DATA_W = 32, //PARAM CPU data width
     parameter ADDR_W = `iob_gpio_swreg_ADDR_W //MACRO CPU address section width
     )
   (

   //CPU interface
`include "iob_s_if.vh"

    // inputs and outputs have dedicated interface
    input [GPIO_W-1:0] gpio_input,
    input [15:0] gpio_sw,
    output [GPIO_W-1:0] gpio_output,
    // output enable can be used to tristate outputs on external module
    output [GPIO_W-1:0] gpio_output_enable,
    output [15:0] gpio_led,
    output [7:0] gpio_sseg_ca,
    output [7:0] gpio_sseg_an,
    	
`include "iob_gen_if.vh"
    );

//BLOCK Register File & Configuration control and status register file.
`include "iob_gpio_swreg_gen.vh"

    // SWRegs
    `IOB_WIRE(GPIO_OUTPUT_ENABLE, DATA_W)
    iob_reg #(.DATA_W(DATA_W))
    gpio_output_enable_reg (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_OUTPUT_ENABLE_en),
        .data_in    (GPIO_OUTPUT_ENABLE_wdata),
        .data_out   (GPIO_OUTPUT_ENABLE)
    );

    `IOB_WIRE(GPIO_OUTPUT, DATA_W)
    iob_reg #(.DATA_W(DATA_W))
    gpio_output_reg      (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_OUTPUT_en),
        .data_in    (GPIO_OUTPUT_wdata),
        .data_out   (GPIO_OUTPUT)
    );
    
        // Switches LEDS
    `IOB_WIRE(GPIO_LED, 16)
    iob_reg #(.DATA_W(16))
    gpio_led_reg (
        .clk        (clk),
        .arst       (rst),
        .rst        (rst),
        .en         (GPIO_LED_en),
        .data_in    (GPIO_LED_wdata),
        .data_out   (GPIO_LED)
    );

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

   // Read GPIO
   assign GPIO_INPUT_rdata = gpio_input;

   // Write GPIO
   assign gpio_output = GPIO_OUTPUT;
   assign gpio_output_enable = GPIO_OUTPUT_ENABLE;
   
   // Read SW
   assign GPIO_SW_rdata = gpio_sw;

   // Write LEDS 
   assign GPIO_LED = gpio_sw;
   assign gpio_led = GPIO_LED;
   assign gpio_sseg_ca = GPIO_SSEG_CA;
   assign gpio_sseg_an = GPIO_SSEG_AN;
   
   
   


endmodule
