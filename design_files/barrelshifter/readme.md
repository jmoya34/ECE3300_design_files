# Barrel Shifter

### Design daigram
![bs diagram](/imgs/design_diagrams/barrelshifter.png)

### Empty shell to use in top file
```verilog
wire [3:0] barrelshifter_output; // this is only if you need it and the bus # is set to the default parameter 4
barrelshifter_n #(.SIZE_BSN(4)) my_barrelshifter(
    .b(),
    .sr_sel(),
    .sel(),
    .p()
);
```