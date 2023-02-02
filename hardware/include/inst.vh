   //
   // GPIO
   //

   iob_gpio gpio0
     (
      .clk     (clk),
      .rst     (rst),

      // Registers interface
      
      .gpio_sw		(gpio_sw),
      .gpio_sseg_ca	(gpio_sseg_ca),
      .gpio_sseg_an	(gpio_sseg_an),

      // CPU interface
      .valid   (slaves_req[`valid(`GPIO)]),
      .address (slaves_req[`address(`GPIO,`iob_gpio_swreg_ADDR_W+2)-2]),
      .wdata   (slaves_req[`wdata(`GPIO)]),
      .wstrb   (slaves_req[`wstrb(`GPIO)]),
      .rdata   (slaves_resp[`rdata(`GPIO)]),
      .ready   (slaves_resp[`ready(`GPIO)])
      );
