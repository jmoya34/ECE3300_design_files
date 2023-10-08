# Implenting Counter Using Always Block

### Objective
Create a squential circuit that has a clock that increments a counter using the 100 MHz clock from the NEXYS and display on the 7 segment display.

### New Concepts
1. Clock Divider
2. Creating a clock in a test bench
3. Parameters

# Important difference about the files designs
### Implementing counter using seperate clock division module design
Folder: [Counter using clk divison module](/lab_files/lab3_counter/counter_using_clkDiv_design/)

The clock divider module:
```verilog
module clock_divider #(parameter DIVISOR = 28'd100000000) // Nexyus clock is 100Mhz
                    (
                    input clock_in, 
                    output reg clock_out 
                    );
                    
                    reg[27:0] counter=28'd0;
                    
                    // For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
                    // You will modify the DIVISOR parameter value to 28'd50.000.000
                    // Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
                    always @(posedge clock_in)
                    begin
                     counter <= counter + 28'd1;
                     if(counter>=(DIVISOR-1))
                      counter <= 28'd0;
                     clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
                    end     
endmodule
```
This module when called upon once adds **10 look up tables**. Though it makes it simple to divde the clock, it creates a large creation of LUT.

### Implementation of counter at top file
Another method to create clock division is at the topmost file is to create the following block of code and assign your xdc clock to be the variable inside the **always(@posedge clk)** and the clock you use for modules be the clk_out.

```verilog
reg [31:0] counter = 0;
reg clk_out = 0;
always @(posedge clk)
begin
    counter = counter + 1;
    if (counter == 100000000/4)
    begin
        clk_out = ~clk_out;
        counter = 0;
    end 
end
```


# Creating a clock in the test bench

Method 1:
```verilog
// Clock generator for uch_clk
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
```

Method 2: 
```verilog 
// generating clock
initial
    begin: INIT_CLK
        clk = 1;
    end
always
    begin
        #1 clk = ~clk;
    end 
```