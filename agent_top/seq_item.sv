class seq_item extends uvm_sequence_item;

`uvm_object_utils(seq_item)
	rand logic a;
	rand logic b;
	rand logic [2:0] mode;
	
logic y;

function new(string name="seq_item");
super.new(name);
endfunction

/* `uvm_object_utils_begin(seq_item)
`uvm_field_int(a, UVM_ALL_ON)
`uvm_field_int(b, UVM_ALL_ON)
`uvm_field_int(mode, UVM_ALL_ON)
`uvm_field_int(y, UVM_ALL_ON)
`uvm_object_utils_end */

constraint A{a!=b;};
//NOT

/* constraint output_c {if(mode==3'b000) 
                     {
							y==(a&b);
					 }
					 else if(mode==3'b001)
					 {
							y==(a|b);
					 }
					 else if(mode==3'b010)
					 {
							y==(a^b);
					 }
					 else if(mode==3'b011)
					 {
					    y==~(a&b);
					 }
					 else if(mode==3'b100)
					 {
					     y==~(a|b);
					 }
					 else if(mode==3'b101)
					 {
					     y==(a~^b);
					 }
					 else if(mode==3'b110)
					 {
					      y==a;
					 }
					 else if(mode==3'b111)
					 {
				      	 y==~a;
					 }
				} */
endclass
					 
					 
	
