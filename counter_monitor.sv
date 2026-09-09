class counter_monitor extends uvm_monitor;
    `uvm_component_utils(counter_monitor)
    
    virtual counter_if vif;
    uvm_analysis_port #(counter_item) ap;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Counter interface not found")
    endfunction
    
    task run_phase(uvm_phase phase);
        counter_item item;
        forever begin
            @(posedge vif.clk);
            #1;  // Changed from #1step to #1 for simulation delay
            
            item = counter_item::type_id::create("item");
            item.rst_n = vif.rst_n;
            item.enable = vif.enable;
            item.count = vif.count;
            
            `uvm_info("COUNTER_MON", $sformatf("rst_n=%0b enable=%0b count=%0d", 
                      item.rst_n, item.enable, item.count), UVM_MEDIUM)
            ap.write(item);
        end
    endtask
endclass
