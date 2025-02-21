class base_seq extends uvm_sequence#(seq_item);

`uvm_object_utils(base_seq)

	function new(string name="base_seq");
	super.new(name);
	endfunction

//MODE 0 AND
	task body();
    seq_item req;
	req=seq_item::type_id::create("req");
	
	start_item(req);
		assert(req.randomize() with {mode==0;});
		`uvm_info("SEQ",$sformatf("\n AND GATES INPUTS: a=%0d, b=%0d, mode=%0d@", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 1 OR
	start_item(req);
		assert(req.randomize() with {mode==1;});
		`uvm_info("SEQ",$sformatf("\n OR GATES INPUTS: a=%0d, b=%0d, mode=%0d@", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 2 XOR
	start_item(req);
		assert(req.randomize() with {mode==2;});
		`uvm_info("SEQ",$sformatf("\n XOR GATES INPUTS: a=%0d, b=%0d, mode=%0d@", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 2 NAND
	start_item(req);
		assert(req.randomize() with {mode==3;});
		`uvm_info("SEQ",$sformatf("\n NAND GATES INPUTS: a=%0d, b=%0d, mode=%0d", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 3 NOR 
	start_item(req);
		assert(req.randomize() with {mode==4;});
		`uvm_info("SEQ",$sformatf("\n NOR GATES INPUTS: a=%0d, b=%0d, mode=%0d", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 4 XNOR 
	start_item(req);
		assert(req.randomize() with {mode==5;});
		`uvm_info("SEQ",$sformatf("\n XNOR GATES INPUTS: a=%0d, b=%0d, mode=%0d", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 6 BUF
	start_item(req);
		assert(req.randomize() with {mode==6;});
		`uvm_info("SEQ",$sformatf("\n BUF GATES INPUTS: a=%0d, b=%0d, mode=%0d", req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#1;

//MODE 7 NOT
	start_item(req);
		assert(req.randomize() with {mode==7;});
		`uvm_info("SEQ",$sformatf("\n NOT GATES INPUTS: a=%0d, b=%0d, mode=%0d",req.a,req.b,req.mode), UVM_LOW);
	finish_item(req);
#5;

	endtask 
endclass



