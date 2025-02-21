class driver extends uvm_driver#(seq_item);

  `uvm_component_utils(driver)

virtual gate_if vif;

  function new(string name = "driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     $display("I am in the build_phase of driver");
		if(!uvm_config_db#(virtual gate_if)::get(this,"","vif",vif))
			begin
			   `uvm_fatal(get_type_name(),"virtual interface not set")
			end
  endfunction

task run_phase(uvm_phase phase);
//$display("I am in the driver run_phase");
	seq_item req;
	$display("I am in the driver run_phase");
	req=seq_item::type_id::create("req");
		forever 
			begin
			seq_item_port.get_next_item(req);
			vif.a=req.a;
			vif.b=req.b;
			vif.mode=req.mode;
			`uvm_info(get_type_name(),$sformatf("A=%0d | B=%0d | MODE=%0d |", req.a, req.b, req.mode), UVM_LOW);
			seq_item_port.item_done();
			end
	  endtask
endclass

