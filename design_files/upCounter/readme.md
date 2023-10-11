# Up counter Either hex or bcd

### Design daigram
![UCH diagram](/imgs/design_diagrams/upCounter.png)

```verilog
upCounter myCounter(
    .counter_mux_en(),
    .counter_mux_rst(),
    .counter_mux_clk(),
    .counter_mux_select(),
    .counter_mux_led_out()
);     
```