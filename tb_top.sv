import uvm_pkg::*;

    import counter_pkg::*;
`include "uvm_macros.svh"

module tb_top;
    logic clk;
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    counter_if vif(clk);
    
    counter dut (
        .clk    (clk),
        .rst_n  (vif.rst_n),
        .enable (vif.enable),
        .count  (vif.count)
    );
    
    initial begin
        vif.rst_n = 0;
        vif.enable = 0;
        uvm_config_db#(virtual counter_if)::set(null, "*", "vif", vif);
        run_test("counter_test");
    end
endmodule
