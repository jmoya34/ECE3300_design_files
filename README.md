# Verilog (ECE3300) 

### Who is this for?
The students of Professor Ali who need to reference previously created modulues for the swift creation of future implementation onto **NEXYS-100T**.

### Important details to know
* Projects created and built are used in Vivado 2018.2 for the xc7a100tcsg324 chip
* Though the design files are parameterized as much as possible, the actual implementation of them in lab files differ because of the date modifications were made to the modules
* Some modules may not be optimized due to level of design put into modules or lack of knowledge at time of creation of certain modules.

### How to use this repo?
* The plans for this repo is to have design modules, entire lab builds that were approved, and basic important concept of Vivado aimed to help assist students.

### [Beginner guide](/Beginner_guide/)
* A folder dedicated how to create a new project, setup the chip you're using, and create a new module, test bench, and set up your xdc.

### Trouble shooting errors explained


### List of designs 
1. [Fa1bit.v](/design_files/FA1bit/) 
    - A single Full Adder
2. [FAnbit_RCA.v](/design_files/FAnbit_RCA/)
    - N bit ripple carry adder
3. [HA.v](/design_files/HA/)
    - A single Half Adder
4. [mux_nx1.v](/design_files/mux_nx1/)
    - N bit number of input mux
5. [ssd_driver.v](/design_files/ssd_driver/)
    - 4 input, 7 wire output to 7 segment (possible combinations 0-F)
6. [shlr_n.v](/design_files/shlr_n/)
    - N bit right shifter
7. [ucb.v](/design_files/ucb/)
    - Clk input, 4 output that resets once the input has gone through 9 in decimal
8. [uch.v](/design_files/uch/)
    - Clk input, 4 output that resets once the input has gone through 15 in decimal
9. [uch_ucb_ssd.v](/design_files/uch_ucb_ssd/)
    - A combination of UCB and UCH. Includes a select to switch between the two and clock divider as a parameter labled **clk_counter_value**
10. [d_ff.v]()
    - Implementation of D flip flops
11. [nd_ff.v]()
    - N bit D flip flop
12. [Barrel Shifter](/design_files/barrelshifter/)
    - Shifts or rotates bits, is parameterized
13. [Clk counter / Clk divider](/design_files/clock_manager/)
    - Is a counter but can be used to create a clock divider using 32 as parameter
14. [2x1 Mux N input, N output](/design_files/mux2x1_ninput_noutput/)
    - 2 input parameters and 1 output parameters with a both inputs and outputs having N wires
15. [upCounter (4bit output)](/design_files/upCounter/)
    - Outputs BCD or Hex output in 4 bit output

### List of Labs
1. [Lab 1](/lab_files/lab1_decoder/): 4x16 Decoder
2. [Lab 2](/lab_files/lab2_7seg/): 7 segment output using 4 switches, implemented using always block
3. [Lab 3](/lab_files/lab3_counter/): 7 segment output using counter, implemented using always block and clock divider



![Monkey Verilog meme](/imgs/verilog_monkey.png)