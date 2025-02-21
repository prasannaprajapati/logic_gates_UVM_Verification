module logic_gate
	(
	 input [2:0] mode, // Mode input to select the operation
	 input a, b, // Inputs for the logic gate operations
	 output reg y // Output of the selected operation
	);
 // Define parameters for each logic operation
	 parameter AND = 3'b000, // AND gate
				 OR = 3'b001, // OR gate
				 XOR = 3'b010, // XOR gate
				 NAND = 3'b011, // NAND gate (Negated AND)
				 NOR = 3'b100, // NOR gate (Negated OR)
				 XNOR = 3'b101, // XNOR gate (Negated XOR)
				 BUF = 3'b110, // Buffer (passes through 'a')
				 NOT = 3'b111; // NOT gate (Negation of 'a')
 always @(*)
	 begin
		 case(mode)
			 AND: y = a & b; 	// AND gate
			 OR: y = a | b; 	// OR gate
			 XOR: y = a ^ b; 	// XOR gate
			 NAND: y = ~(a & b);// NAND gate (Negated AND)
			 NOR: y = ~(a | b); // NOR gate (Negated OR)
			 XNOR: y = a ~^ b; 	// XNOR gate (Negated XOR)
			 BUF: y = a; 		// Buffer (just passes through 'a')
			 NOT: y = ~a; 		// NOT gate (Negation of 'a')
			 default: y = 1'b0; // Default case to handle unexpected mode values
		 endcase
	 end
endmodule
