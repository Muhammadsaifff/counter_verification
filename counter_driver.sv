class counter_driver extends uvm_driver #(counter_item);
    `uvm_component_utils(counter_driver)

    virtual counter_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (!uvm_config_db#(virtual counter_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Counter interface not found")
    endfunction

    task run_phase(uvm_phase phase);
        counter_item req;
        forever begin
            seq_item_port.get_next_item(req);
            drive_item(req);
            seq_item_port.item_done();
        end
    endtask

    task drive_item(counter_item req);
        @(negedge vif.clk);
        
        vif.rst_n  <= req.rst_n;
        vif.enable <= req.enable;
        // Note: count is driven by DUT, not by driver

        `uvm_info("DRIVER",
                  $sformatf("rst_n=%0b enable=%0b",
                            req.rst_n, req.enable),
                  UVM_MEDIUM)
    endtask

endclass
