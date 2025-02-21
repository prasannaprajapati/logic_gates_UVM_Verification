class base_test extends uvm_test;

`uvm_component_utils(base_test)

env env_h;
base_seq bseq;

	function new(string name="base_test", uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$display("I am in the base_test build_phase"); 
		env_h=env::type_id::create("env_h",this);
	endfunction

	task run_phase(uvm_phase phase);
		$display("I am in the base_test run_phase");
			phase.raise_objection(this);
				bseq=base_seq::type_id::create("bseq");
				bseq.start(env_h.agt.seqr);
				#1;
			phase.drop_objection(this);
		`uvm_info(get_type_name(),"END OF TESTASE", UVM_LOW); 
	endtask


	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction
endclass
