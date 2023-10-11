# 2x1 Mux with N input, N output

### Design daigram
![UCH diagram](/imgs/design_diagrams/mux2x1_Ninput_Noutput.png)

### Empty shell to use in top file
```verilog
mux2x1_Ninput#(.SIZE(4)) my2x1_mux                
    (                                               
    .mux2x1_sel(),         
    .mux2x1_i0(),
    .mux2x1_i1(),                    
    .mux2x1_p()                              
    );       
```