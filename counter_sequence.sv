class counter_sequence extends uvm_sequence #(counter_item);
    `uvm_object_utils(counter_sequence)
    
    function new(string name = "counter_sequence");
        super.new(name);
    endfunction
    
    virtual task body();
        counter_item req;
        
        // Test 1: Reset sequence
        `uvm_do_with(req, { rst_n == 1'b0; enable == 1'b0; })
        
        // Test 2: Enable counting
        repeat (10) begin
            `uvm_do_with(req, { rst_n == 1'b1; enable == 1'b1; })
        end
        
        // Test 3: Disable counting
        repeat (5) begin
            `uvm_do_with(req, { rst_n == 1'b1; enable == 1'b0; })
        end
        
        // Test 4: Reset during counting
        `uvm_do_with(req, { rst_n == 1'b0; enable == 1'b1; })
        `uvm_do_with(req, { rst_n == 1'b1; enable == 1'b1; })
        
        // Test 5: Random sequence
        repeat (20) begin
            `uvm_do(req)
        end
    endtask
endclass
