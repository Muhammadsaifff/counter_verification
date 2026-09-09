interface counter_if(input logic clk);
    logic rst_n;
    logic enable;
    logic [7:0] count;
    
    // Clocking block for driver
    clocking drv_cb @(posedge clk);
        default input #1ns output #1ns;
        output rst_n;
        output enable;
        input count;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1ns;
        input rst_n;
        input enable;
        input count;
    endclocking
    
    modport DRV (clocking drv_cb, output clk);
    modport MON (clocking mon_cb, input clk);
endinterface
