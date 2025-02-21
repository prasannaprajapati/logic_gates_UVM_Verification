# Logic Gates UVM Verification

This repository contains a complete UVM-based verification environment for basic logic gates (AND, OR, XOR, NAND, NOR, XNOR, NOT, BUFFER). The testbench is designed to verify the functionality of all logic operations and provide comprehensive coverage.
## UVM TB
![Alt text](/images/logic_gate_UVM_tb.png)
## Project Structure

```
logic_gates_uvm/
├── rtl/
│   └── logic_gates.sv
│   └── gate_if.sv 
├── agent_top/
│   ├── seq_item.sv
│   ├── base_seqs.sv
│   ├── sequencer.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   └──agent.sv
└── sim/
│    └── Makefile
└── test/
│     ├── base_test.sv
│     └──gate_pkg.sv
└── tb/
    ├── env.sv
    ├── scoreboard.sv
    └── top.sv

```

## Components Description

### RTL Design (logic_gates.sv)
The DUT implements six basic logic gates:
- AND gate
- OR gate
- XOR gate
- NAND gate
- NOR gate
- NOT gate
- BUFFER gate

### UVM Components

#### 1. Transaction Class (seq_item.sv)
- Defines the transaction items containing input and output signals
- Implements randomization for input signals
- Includes UVM field macros for automation

#### 2. Sequence (sequence.sv)
- Generates random test scenarios
- Implements specific test cases for corner cases
- Controls the stimulus generation flow

#### 3. Driver (driver.sv)
- Converts transaction-level items to pin-level signals
- Drives the DUT interface according to the protocol

#### 4. Monitor (monitor.sv)
- Samples the DUT interface
- Converts pin-level activity to transaction-level items
- Sends transactions to scoreboard for verification

#### 5. Scoreboard (scoreboard.sv)
- Implements the reference model
- Compares DUT output with expected results
- Reports any mismatches or errors

## Test Scenarios

1. **Random Testing**
   - Random combinations of inputs
   - Full coverage of all possible input combinations

2. **Directed Testing**
   - Specific test cases for each gate
   - Corner cases testing
   - All-zeros and all-ones testing

3. **Coverage Goals**
   - 100% functional coverage of all input combinations
   - 100% code coverage of RTL
   - Toggle coverage of all signals

## Coverage Metrics

The testbench implements the following coverage points:

```systemverilog
covergroup logic_gates_cg;
    a_cp: coverpoint tr.a;
    b_cp: coverpoint tr.b;
    gates_cross: cross a_cp, b_cp;
endgroup
```

## Running Tests

1. **Prerequisites**
   - UVM 1.2 or later
   - SystemVerilog compatible simulator
   - Make utility

2. **Simulation Commands**
```bash
# Clean previous results
make clean

# Run all tests
make run

# Run specific test
make run TEST=logic_gates_basic_test
```

3. **Viewing Results**
   - Coverage reports are generated in `./sim/coverage`
   - Logs are available in `./sim/logs`
   - Waveforms are saved in `./sim/waves`

## Example Test Output

```
UVM_INFO: Running test logic_gates_basic_test...
UVM_INFO: Generating 1000 random transactions...
UVM_INFO: Coverage reached: 100%
UVM_INFO: All tests passed successfully!
UVM_INFO: Test completed with 0 errors
```

## Advanced Features

1. **Error Injection**
   - Capability to inject errors for negative testing
   - Verification of error detection mechanisms

2. **Performance Metrics**
   - Simulation time tracking
   - Coverage progression analysis

3. **Debug Features**
   - Transaction recording
   - Signal tracing
   - UVM messaging system utilization

## Common Issues and Solutions

1. **Compilation Issues**
   - Ensure proper UVM installation
   - Check package imports
   - Verify SystemVerilog compiler settings

2. **Runtime Issues**
   - Enable UVM_INFO messages for debugging
   - Check phase transitions
   - Verify configuration settings

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any queries or support, please open an issue in the repository.
