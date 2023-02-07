#include <stdbool.h>

#include "iob_gpio_swreg.h"

//GPIO functions

//Set GPIO base address
void gpio_init(int base_address);

uint16_t gpio_sw_get();

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_sseg_ca(uint8_t value);

//Set mask for outputs (bits 1 are driven outputs, bits 0 are tristate)
void gpio_set_sseg_an(uint8_t value);
