import uvm_pkg::*;
import gate_pkg::*;
`include "uvm_macros.svh"
//`include "gate_if.sv"
//`include "gate_pkg.sv"

module top;

gate_if vif();

logic_gate DUT(.mode(vif.mode),
				.a(vif.a),
				.b(vif.b),
				.y(vif.y));

initial 
	begin
		uvm_config_db#(virtual gate_if)::set(uvm_root::get(),"*","vif",vif);
	end

	initial
		begin
			run_test("base_test");
		end
endmodule
