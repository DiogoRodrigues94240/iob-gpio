#include "iob-gpio.h"

//GPIO functions

//Set GPIO base address
void gpio_init(int base_address){
  IOB_GPIO_INIT_BASEADDR(base_address);
}

//Get values from inputs
uint32_t gpio_get(){
  return IOB_GPIO_GET_INPUT();
}

//Set values on outputs
void gpio_set(uint32_t value){
  IOB_GPIO_SET_OUTPUT(value);
}

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_output_enable(uint32_t value){
  IOB_GPIO_SET_OUTPUT_ENABLE(value);
}

uint16_t gpio_sw_get(){
  return IOB_GPIO_GET_SW();
}

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_sseg_ca(uint8_t value){
  IOB_GPIO_SET_SSEG_CA(value);
}

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_sseg_an(uint8_t value){
  IOB_GPIO_SET_SSEG_AN(value);
}
