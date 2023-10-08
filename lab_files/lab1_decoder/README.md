# 2x4 Decoder

Schematic:

<img src="https://www.elprocus.com/wp-content/uploads/2-to-4-Decoder-Circuit-1.jpg" width="200" height="200" />

The development of the 2x4 decoder in verilog can be implemented using

1. **Gate Level** 
2. **Data Flow**
3. **Behavior Model**

The file [decoder_2_4](/lab_files/lab1_decoder/design_files/decoder_2_4.v) is shown created using keyword **and** & **not** to desribe the circuitry using **Gate Level** implementation. 

```verilog
module decoder_2_4(
        input x0,
        input x1,
        input E,
        output d0,
        output d1,
        output d2,
        output d3
    );
    
        wire x0_not;
        wire x1_not;
        not(x0_not, x0);
        not(x1_not, x1);
        
        and(d0, x0_not, x1_not, E);
        and(d1, x0, x1_not, E);
        and(d2, x0_not, x1, E);
        and(d3, x0, x1, E);
    
endmodule
```

The use of **input** dicates that we are creating a signal that goes into the variable, for this example x0, x1, and E are an input signals. The input signals are changed from external sources that can used in an XDC or testbench to test the output of our design. 

### Using gate level implementation
The use of the **gate level** implementation follows the same pattern where the first element is the output and following elemts are inputs. Take the line:
```verilog 
and(d0, x0_not, x1_not, E);
```
The inputs x0_not, x1_not, and E are being **anded** where the output is d0.

The same level is is thinking for the **not gate** where first element is the output, and second element is input. The only difference is because the input cannot equal the output of the not, we have to create a wire that connects to the ouptut of the not gate. Only after creating that wire and connecting it to the output of the not gate can we use it as the input to the and gate. 
```verilog
wire x0_not;
not(x0_not, x0);
```
![not gate explanation](/imgs/lab_schematic_photos/notgate_explanation.png)

### List of gates 
* not()
* and()
* or()
* nor()
* nand()
* xor()
* xnor()


### Drawing of same schematic with input/output labels

![img of 2x4 decoder](/imgs/lab_schematic_photos/decoder2x4.png)

## Resources Used
![usage of resources by 2x4 decoder](/imgs/lab_schematic_photos/decoder2x4_usage.png)
LUT Use: 2

Total Power: 0.757


# 4x16 Decoder
File: [decoder_4_16](/lab_files/lab1_decoder/design_files/decoder_4_16.v)


![not gate explanation](/imgs/lab_schematic_photos/deocder4x16_schematic.png)

Creating a 4x16 decoder introduces the concept of **hierarchical design** where we use a design we have previously created to block them together and create a new design element. In the case of a 4x16 Decoder, we use our 2x4 decoder to create the 4x16 using for loops.

### New Concepts learned from this lab
1. Bus of wires
2. Hierarchical modeling (hierarchical design)
3. Combing Hierarchical modeling with for loops 

### new syntax 
* genvar
* generate 
* endgenerate

### **How to incorperate hierarchical design**
From our previous code of decoder_2_4 we had the module as:
```verilog
module decoder_2_4(
        input x0,
        input x1,
        input E,
        output d0,
        output d1,
        output d2,
        output d3
    );
```

meaning to incorporate the decoder_2_4 module we have to structure it the sameway in our new file called The file [decoder_4_16](/lab_files/lab1_decoder/design_files/decoder_4_16.v). To make a decoder_2_4 we need the same amount of inputs and outputs which is why in the code block below, I create inputs for inputs E, x0, x1 and a **bus of wire** outputs for d0, d1, d2, and d3. 

```verilog
module decoder_4_16(
    input port_E,
    input port_x2,
    input port_x3,
    );
    
    wire [3:0] decoder1_output;
    decoder_2_4 Enabler(
                .E(port_E),
                .x0(port_x2),
                .x1(port_x3),
                .d0(decoder1_output[0]),
                .d1(decoder1_output[1]),
                .d2(decoder1_output[2]),
                .d3(decoder1_output[3])
        );
```
With that block of code I have created a single 2x4 decoder with outputs that I can use to connect to other 2x4 decoders. To create the other 4 decoders it would be **INEFFECTIVE** to create each one individually, so we resort to using a for loop to **effeciently** create 4 new 2x4 decoders.

### **Hierarchical design using For Loops**
Pay attention specifically from **genvar** to **endgenerate** 

```verilog
module decoder_4_16(
    input port_E,
    input port_x0, // Input of the 4 other decoders 
    input port_x1, // Input of the 4 other decoders
    input port_x2,
    input port_x3,

    // Outputs of 4x16 decoder 
    output [3:0] port_d0, 
    output [3:0] port_d1,
    output [3:0] port_d2,
    output [3:0] port_d3
    );

    wire [3:0] decoder1_output;
    /* Code from previous code block here*/

    genvar i;
    generate
    for(i = 0; i < 4; i = i+1)
    decoder_2_4 decoder4(
                .E(decoder1_output[i]),
                .x0(port_x0),
                .x1(port_x1),
                .d0(port_d0[i]),
                .d1(port_d1[i]),
                .d2(port_d2[i]),
                .d3(port_d3[i])
    );
    endgenerate
endmodule
```

Notice how we use **genvar** to create our variable to iterate the for loop. This is specifically used to generate instances of modules we have previously created, do not confuse this with **integer** which is for the test benches. The keywords **generate** and **endgenerate** is used to organize the code and state how the section of code is meant to be repeatly ran (**DO NOT FORGET TO INCLUDE**).

In the actual code, what we are doing is following the schematic where the enabler of every decoder we create is the **OUTPUT** of the 1st decoder we created (look at the schematic for the 4x16 decoder). The inputs for all 4 new decoders share the same x0 and x1 input which is why we can keep those the same for every new instance of the 2x4 decoder. In my method of creating the outputs for the decoder, i created a bus of wires for every decoder outputs so that D0-D3 will be the equivalent of port_d0[0], port_d0[1], port_d0[2], port_d0[3], and then moves onto the next port port_d1[0].

### Drawing of same schematic with input/output labels
![Alt text](/imgs/lab_schematic_photos/decoder4x16_drawn_explanation.png)

## Resources Used
![usage of resources by 2x4 decoder](/imgs/lab_schematic_photos/decoder2x4_usage.png)
LUT Use: 8

Total Power: 1.13

# Test bench of 4x16 decoder
To test our 4x16 decoder we need to set the inputs of our testbench file as **register** and outputs as **wire**. The syntax reg allows for the signals to change through time in our test bench.

```verilog
module decoder_4_16_tb();
    reg Port_X0;
    reg Port_X1;
    reg Port_X2;
    reg Port_X3;
    reg Enable;
    wire [3:0] Port_D0;
    wire [3:0] Port_D1;
    wire [3:0] Port_D2;
    wire [3:0] Port_D3;
    
    decoder_4_16 DECODERTB(
        .port_x0(Port_X0),
        .port_x1(Port_X1),
        .port_x2(Port_X2),
        .port_x3(Port_X3),
        .port_E(Enable),
        .port_d0(Port_D0),
        .port_d1(Port_D1),
        .port_d2(Port_D2),
        .port_d3(Port_D3)
    ); 
```
Notice how the module has closed brackets after the name **decoder_4_16_tb** because we are not creating a new design with new inputs and outputs, but rather testing existing ones.

We make an instance of the 4x16 decoder using the reg we created as the input and wire as the output. When we run the simulation, it will show us the values of both the inputs and outputs as the names of the variables we initalize in order.

### Changing the values of the reg values
It can be daunting at first to know what and when to set the variable to since there are so many, but remember the whole point of the test bench is to see how the inputs effect the output. In this case I want to know in what way will my output be effected if my enable is off/on, and what will happen with any combination of ports on or off.

```verilog
    integer i, j, k, l, m;
    initial
        begin: Decoder_4_to_16
            for(i = 0; i < 2; i = i + 1)
                begin: Ebit
                Enable = i;
                #20
                for(j = 0; j < 2; j = j + 1)
                    begin: X0bit
                    Port_X0 = j;
                    #20
                    for(k = 0; k < 2; k = k + 1)
                        begin: X1bit
                        Port_X1 = k;
                        #20
                        for(l = 0; l < 2; l = l + 1)
                            begin: X2bit
                            Port_X2 = l;
                            #20
                            for(m = 0; m < 2; m = m + 1)
                                begin: X3bit
                                Port_X3 = m;
                                #20;
                            end
                        end
                    end
                end
            end
        #20
        $finish;
        end      
endmodule
```
To make this bit of code more understandable, lets break down some aspects of it. I create variables i, j, k, l, and m so i could create a for loop for each one of those. to begin changing the value values of the registers we have to use the keyword **initial** and then begin changing values.

The keyword **begin** & **end** is the equivalent of brackets in verilog. We are also capable of giving every begin a name to help give explanation of any following code. Here is an equivalent comparison.

Verilog:
```verilog
integer = i;
initial
    begin: CHANGE_E_REG
        for(i = 0; i < 2; i = i+1)
            Enable = i;
    end
```
C :
```c
int i;
    {
    for(i = 0; i < 2; i++)
        Enable = i;
    }
```

You might ask why is it that you don't need a begin and end for the inside of the For Loop inside the verilog code block, and that has to do with single lines of codes for if statements, for loops, and while loops don't need brackets. But if there are 2 lines of code or more you need another begin and end, just like how you need brackets in C.

Verilog:
```verilog
integer = i;
initial
    begin: CHANGE_E_REG
        for(i = 0; i < 2; i = i+1)
            begin: Assign_E
            Enable = i;
            #20;
            end
    end
```
C :
```c
int i;
    {
    for(i = 0; i < 2; i++)
        {
        Enable = i;
        ADD_DELAY();
        }
    }
```

### **Analyzing Simulation Waveform**
File: [decoder_4_16 simulation](/lab_files/lab1_decoder/test_bench/decoder_4_16_tb.v)
![simulation of decoder](/imgs/lab_schematic_photos/decoder4x16_simulation.png)

We can break down this simulation down into 3 part
1. Input waveforms
2. Output waveforms
3. Integer values 

From our previous schematic of the 4x16 decoder we know that if the Enable is 0, then there will be no output where we can see at what point does the Enable switch to a 1. This means that our outputs **Port_D0[3:0], Port_D1[3:0], Port_D2[3:0], Port_D3[3:0],** will stay 0 until the enable is turned on. 

We can see the moment when the enable turns on, all inputs are 1 and knowing how decoders work we known d15 will be the only output that displays a 1. From how I designed the 4x16 decoder, output d15 is named Port_D3[3]. So to inspect that our decoder is working as exepected we can extend the Port_D3[3:0] array on the simulation to see if it is true that Port_D3[3] = 1.

![usage of resources by 2x4 decoder](/imgs/lab_schematic_photos/decoder4x16_simulation_d15.png)

We see that that Port_D3[3] = 1, therefore we can guarentee that my decoder is working. We can check for every value combination of the ports if we are still unsure if we designed the modulue correct.