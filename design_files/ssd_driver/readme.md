# SSD Driver

### Design daigram
![SSD Driver diagram](/imgs/design_diagrams/ssd_driver.png)

### Empty shell to use in top file
```verilog
ssd_driver my_ssd_driver(                                          //
    .ssd_driver_port_in(),                         // Input is a 4 bit number, represents values from 0 to 15, or 0-9 and A-F in hex
    .ssd_driver_port_dp_in(),                            // Input for controlling decimal point
    .ssd_driver_port_led(),                       // Output LEDs to represent current input value
    .ssd_driver_port_cc(),                        // Output to 7 segment
    .ssd_driver_port_dp_out(),                          // Output for decimal point
    .ssd_driver_port_an()                         // Output for anode pins for 7 segments; there are 8 SSDs so 1 bit for display
);      
```