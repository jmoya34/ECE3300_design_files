# Verilog (ECE3300) 

### Who is this for?
The students of Professor Ali who need to reference previously created modulues for the swift creation of future implementation onto **NEXYS-100T**.

### Important details to know
* Projects created and built are used in Vivado 2018.2 for the xc7a100tcsg324 chip
* Though the design files are parameterized as much as possible, the actual implementation of them in lab files differ because of the date modifications were made to the modules
* Some modules may not be optimized due to level of design put into modules or lack of knowledge at time of creation of certain modules.

### How to use this repo?
* The plans for this repo is to have design modules, entire lab builds that were approved, and basic important concept of Vivado aimed to help assist students.

### List of designs 
1. [Fa1bit.v]() 
    - A single Full Adder
2. [FAnbit_RCA.v]()
    - N bit ripple carry adder
3. [HA.v]()
    - A single Half Adder
4. [mux_nx1.v]()
    - N bit number of input mux
5. [ssd_driver.v]()
    - 4 input, 7 wire output to 7 segment (possible combinations 0-F)
6. [shlr_n.v]()
    - N bit right shifter
7. [ucb.v]()
    - Clk input, 4 output that resets once the input has gone through 9 in decimal
7. [uch.v]()
    - Clk input, 4 output that resets once the input has gone through 15 in decimal
7. [uch_ucb_ssd.v]()
    - A combination of UCB and UCH. Includes a select to switch between the two and clock divider as a parameter labled **clk_counter_value**



![Monkey Verilog meme](/imgs/verilog_monkey.png)