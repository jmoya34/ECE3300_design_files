# Clock Manager

### Design daigram
![Clk counter diagram](/imgs/design_diagrams/clock_counter.png)

### Empty shell to use in top file
```verilog
wire output_clk; 
clk_counter #(.SIZE(32)) my_clk( // 32 is default therefore speed_sel has 5 input
    .sys_clk(),
    .sys_rst(),
    .speed_sel(),
    .block_clk()
);
```