class scoreboard extends uvm_scoreboard;

`uvm_component_utils(scoreboard)

uvm_analysis_imp #(seq_item, scoreboard) item_collect_export;
seq_item transactions[$];

seq_item data;

covergroup gate_coverage;
	option.per_instance=1;

	A: coverpoint data.a{bins A1[]={0,1};}
	B: coverpoint data.b{bins B1[]={0,1};}
	MODE_CMD: coverpoint data.mode{bins C1[]={0};
									bins C2[]={1};
									bins C3[]={2,3};
									bins C4[]={4,5};
									bins C5[]={6,7};
									}
	Y: coverpoint data.y{bins Y_OUTPUT[]={0,1};}

endgroup

	function new(string name="scoreboard", uvm_component parent=null);
	super.new(name,parent);
	item_collect_export=new("item_collect_export", this);
	gate_coverage=new();
	endfunction

	function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    $display("I am in the build_phase of Scoreboard");
	endfunction: build_phase

	function void write(seq_item item);
	transactions.push_back(item);
	endfunction:write

task run_phase(uvm_phase phase);
	super.run_phase(phase);
		$display("I am in the run_phase of scoreboard");
		forever
			begin
				seq_item curr_trans;
				wait(transactions.size()!=0);
				curr_trans=transactions.pop_front();
				compare(curr_trans);
			end
endtask

task compare(seq_item curr_trans);
	logic expected;

	data=curr_trans;
	gate_coverage.sample();

	//generate the expected output based on the mode
	case(curr_trans.mode)
		3'b000:expected=curr_trans.a & curr_trans.b; //AND
		3'b001:expected=curr_trans.a | curr_trans.b; //OR
		3'b010:expected=curr_trans.a ^ curr_trans.b; //XOR
		3'b011:expected=~(curr_trans.a & curr_trans.b); //NAND
		3'b100:expected=~(curr_trans.a | curr_trans.b); //NOR
		3'b101:expected=curr_trans.a ~^ curr_trans.b;  //XNOR
		3'b110:expected=curr_trans.a; //BUF
		3'b111:expected=~curr_trans.a; //NOT

	default: expected=1'bx;   //default case
endcase


//generate the actual output with expected output
	if(curr_trans.y!==expected)
		begin
			`uvm_error("COMPARE","Transaction failed")
		end 
	else begin
		`uvm_info("COMPARE", $sformatf("Transaction PASSED! MODE=%b, A=%b, B=%b, ACT=%b, EXP=%b", curr_trans.mode, curr_trans.a, curr_trans.b, curr_trans.y, expected), UVM_LOW)

		$display("--------------------------------------------");
		$display("Overal coverage: %0.2f%%", $get_coverage());
					 $display("Coverage of covergroup'FIFO coverage': %0.2f%%", gate_coverage.get_coverage());
					 $display("Coverage of covergroup A INPUT: %0f", gate_coverage.A.get_coverage());
					 $display("Coverage of covergroup B INPUT: %0f", gate_coverage.B.get_coverage());
					 $display("Coverage of covergroup Y OUTPUT: %0f", gate_coverage.Y.get_coverage());
					 $display("Coverage of covergroup MODE: %0f", gate_coverage.MODE_CMD.get_coverage());
		$display("--------------------------------------------");
		$display("--------------------------------------------");
		end
	endtask
endclass
