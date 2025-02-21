class monitor extends uvm_monitor;

`uvm_component_utils(monitor)

uvm_analysis_port #(seq_item) item_collect_port;

virtual gate_if vif;

seq_item mon_item;


//-----------function new constructor----------
	function new(string name="monitor", uvm_component parent);
		super.new(name,parent);
		$display("I am in the run_phase of monitor");
		item_collect_port=new("item_collect_port", this);
	endfunction


//------------build_phase-----------------
function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		$display("I am in the build_phase of monitor");
			if(!uvm_config_db#(virtual gate_if)::get(this,"","vif",vif))
				begin
				 `uvm_fatal(get_type_name(),"virtual interface not set")
				end
		mon_item=seq_item::type_id::create("mon_item",this);
endfunction

task run_phase(uvm_phase phase);
		$display("I am in the monitor run_phase");
		forever 
			begin
				mon_item.a=vif.a;
				mon_item.b=vif.b;
				mon_item.mode=vif.mode;
				mon_item.y=vif.y;
				`uvm_info(get_type_name(),$sformatf("A=%0d | B=%0d | MODE=%0d | Y=%0d", mon_item.a, mon_item.b, mon_item.mode, mon_item.y), UVM_LOW);
				item_collect_port.write(mon_item);
				#1;
		end
	endtask
endclass
