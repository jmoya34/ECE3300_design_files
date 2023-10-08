# Using the 7 Segment Display
**Objective:** Implement a 4 bit input conversion to 7 bit output that connects to one of the eight 7 segment display of the vivado board displaying values 0-F.

### New Concepts
1. **Always Block** implementation
2. Use of keyword **assign**
3. Case statements

### Design of ssd_driver
File: [ssd_driver](/lab_files/lab2_7seg/design_files/ssd_driver.v)

```verilog
module ssd_driver(
                   input [3:0] ssd_driver_port_inp,
                   input ssd_driver_portin_dp,
                   output [3:0] ssd_driver_port_led,
                   output [6:0] ssd_driver_output_cc,
                   output ssd_driver_port_dp,
                   output [7:0] ssd_driver_output_an
                );
```
There is a total of 5 inputs, 4 of which are for changing the value of the 7 segment display. The 5th input is to dictate if the decimal point is on or off. The decimal point does not effect any of the code so we are able to connect the input and output together specifically for decimal point.

In this itteration of the ssd_driver, there is an output that also outputs the input as LEDS to indicate what value the design is reading. The output **output ssd_driver_output_an** is created just as a output to keep the  first 7 segment display always on and the rest always off.

Output **ssd_driver_output_cc** creates the actual 7 wires used to turn off or on the individual segments of the 7 segment display.

### *keep in mind the 7seg display is common anode

```verilog
assign ssd_driver_port_dp = ssd_driver_portin_dp; 
assign ssd_driver_port_led = ssd_driver_port_inp;
assign ssd_driver_output_an = 8'bzzzzzzz0;
```
Assigning inputs and outputs is simple as including the word assign. The left side is what is the output that is being assigned the input. 

- note **8'bzzzzzzz0** creates don't care values and will turn off the values of the other unwanted 7 segmented displays

```verilog
                reg [6:0] ssd_driver_tmp_cc;
                
                always@(ssd_driver_port_inp)
                    begin: SEG_ENC
                        case(ssd_driver_port_inp)
                            4'h0: ssd_driver_tmp_cc = 7'b1000000;
                            4'h1: ssd_driver_tmp_cc = 7'b1111001;
                            4'h2: ssd_driver_tmp_cc = 7'b0100100;
                            4'h3: ssd_driver_tmp_cc = 7'b0110000;
                            4'h4: ssd_driver_tmp_cc = 7'b0011001;
                            4'h5: ssd_driver_tmp_cc = 7'b0010010;
                            4'h6: ssd_driver_tmp_cc = 7'b0000010;
                            4'h7: ssd_driver_tmp_cc = 7'b1111000;
                            4'h8: ssd_driver_tmp_cc = 7'b0000000;
                            4'h9: ssd_driver_tmp_cc = 7'b0011000;
                            4'hA: ssd_driver_tmp_cc = 7'b0001000;
                            4'hB: ssd_driver_tmp_cc = 7'b0000011;
                            4'hC: ssd_driver_tmp_cc = 7'b1000110;
                            4'hD: ssd_driver_tmp_cc = 7'b0100001;
                            4'hE: ssd_driver_tmp_cc = 7'b0000110;
                            4'hF: ssd_driver_tmp_cc = 7'b0001110;
                            
                            default: ssd_driver_tmp_cc = 7'bzzzzzzz;
                        endcase
                    end
                assign ssd_driver_output_cc = ssd_driver_tmp_cc;
endmodule
```
### Explanation as to why we use a reg for the 7 seg output instead of the output var

The reason why we create a register to get the output value is we cannot direclty assign an output inside an **always block**. That is why we assign the the ssd_driver_output_cc to the tmp_cc value.


File: [ssd_driver test bench](/lab_files/lab2_7seg/test_bench/ssd_driver_TB.v)