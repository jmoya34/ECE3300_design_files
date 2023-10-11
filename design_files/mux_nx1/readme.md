# Mux ninput 1 

### Design daigram
![Mux ninput diagram](/imgs/design_diagrams/mux_nx1.png)

### Empty shell to use in top file
```verilog
wire muxnx_output; 
mux_nx1 #(.SIZE(8)) my_nmux               // SIZE sets number of inputs
    (                                               //
    .mux_nx1_sel(),         // The select bit is log2(SIZE)
    .mux_nx1_in(),                    //
    .mux_nx1_out()                              //
    );      
```