class counter_item extends uvm_sequence_item;
    rand bit rst_n;
    rand bit enable;
    rand bit [7:0] count;  // Made this rand for better flexibility
    
    // Add constraints for meaningful values
    constraint valid_values {
        enable dist {1'b1 := 70, 1'b0 := 30};  // Enable more often
        rst_n dist {1'b1 := 80, 1'b0 := 20};   // Reset less often
    }
    
    `uvm_object_utils_begin(counter_item)
        `uvm_field_int(rst_n, UVM_ALL_ON)
        `uvm_field_int(enable, UVM_ALL_ON)
        `uvm_field_int(count, UVM_ALL_ON)
    `uvm_object_utils_end
    
    function new(string name = "counter_item");
        super.new(name);
    endfunction
endclass
