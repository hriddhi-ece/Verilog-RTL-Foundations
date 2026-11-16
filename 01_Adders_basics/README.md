# Combinational Arithmetic (Adders)

This folder contains digital arithmetic circuits. Every design file is paired with an automated testbench (`tb_*.v`) for verification.

### 1. Half Adders
- **Gate-Level:** `HA_gate.v`
- **Dataflow:** `half_adder_data.v`, `half_adder_data1.v`
- **Behavioral:** `HA_case.v`

### 2. Full Adders
- **Gate-Level:** `fa_gate.v`
- **Dataflow:** `FA_data.v`
- **Structural:** `FA_using_HA.v`
- **Behavioral:** `fa_case.v`, `fa_if.v`

### 3. Multi-Bit Adders
- **4-bit Ripple Carry Adder (Structural):** `rca_4bit.v`

### Quick Port Reference
- **Half Adders:** `input a, b` | `output sum, carry`
- **Full Adders:** `input a, b, cin` | `output sum, cout`
- **4-bit RCA:** `input [3:0] a, b`, `input c` | `output [3:0] sum`, `output cout`

### Verification
The `tb_*.v` testbenches apply input patterns to display output signal changes to the console using `$monitor`. These truth tables are designed for visual inspection and do not perform automated property checking.

### How to Simulate (Vivado)
This repository is built around AMD Vivado. To run any testbench:
1. Add the design `.v` file and its matching `tb_*.v` file to your Vivado project.
2. Right-click the testbench in the Hierarchy window and select **Set as Top**.
3. Click **Run Simulation** -> **Run Behavioral Simulation**.

This module is part of the broader RTL foundations path in the repository and is followed by sequential logic topics in `06_Sequential_Logic_Basics/` and debugging guidance in `07_Verilog_Debugging/`.
