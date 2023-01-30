   // GPIO
   input [`GPIO_INPUT_W-1:0] gpio_input,
   output [`GPIO_OUTPUT_W-1:0] gpio_output,
   output [`GPIO_OUTPUT_W-1:0] gpio_output_enable,
   input [15:0] gpio_sw,
   output[15:0] gpio_led,
   output [7:0] gpio_sseg_ca,
   output [3:0] gpio_sseg_an,
