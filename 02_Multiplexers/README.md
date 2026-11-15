# Multiplexer Architectures

This folder contains multiplexer circuits designed across multiple Verilog modeling abstractions. Every design file is paired with an automated testbench (`tb_*.v`) for verification.

### 1. 2-to-1 Multiplexers
* **Gate-Level:** `MUX_2x1_gate.v`
* **Dataflow:** `MUX2x1_data.v`
* **Behavioral:** `MUX_2x1.v`

*(New circuit categories like 4-to-1 or 8-to-1 MUX will be appended below)*

### Quick Port Reference
* **2-to-1 MUX (Behavioral):** `input I0, I1, S` | `output reg Y`
* **2-to-1 MUX (Gate/Dataflow):** `input i0, i1, s` | `output y`

### How to Simulate (Vivado)
This repository is built around AMD Vivado. To run any testbench:
1. Add the design `.v` file and its matching `tb_*.v` file to your Vivado project.
2. Right-click the testbench in the Hierarchy window and select **Set as Top**.
3. Click **Run Simulation** -> **Run Behavioral Simulation**.