# Sequential Logic: Flip-Flops and Registers

This module transitions from combinational logic to sequential logic, introducing clocks, state preservation, and basic memory elements. 

### 1. Latches and Flip-Flops
- **SR Latch (Gate-Level):** `sr_latch.v`
- **SR Flip-Flop:** `sr_ff.v`
- **D Flip-Flop:** `d_ff.v`, `d_ff_clr.v` (with synchronous clear)
- **T Flip-Flop:** `t_ff.v`
- **JK Flip-Flop:** `jk_ff.v`

### 2. Registers
- **Standard 4-bit Register:** `reg_4bit.v`
- **Structural 4-bit Register:** `reg_4bit_str.v` (uses `d_ff.v` and `mux_2x1_gate.v`)
- **Register with Clear/Load:** `reg_4bit_clear.v`
- **Serial-In Parallel-Out (SIPO):** `sipo_4bit.v`
- **Universal Shift Register (PIPO):** `reg_pipo.v` (uses `mux_4x1_pipo.v` and `d_ff_clr.v`)

### 3. Counters
- **4-bit Asynchronous (Ripple) Counter:** `counter_4_async.v`
- **4-bit Johnson Counter:** `count_4_johnson.v`

### Verification
Custom `tb_*.v` testbenches use automated stimulus generation to display truth tables and state transitions directly to the console via `$monitor`. They are meant for visual inspection rather than automated self-checking validation.

### How to Simulate (Vivado)
1. Add the desired design `.v` file(s) and its matching `tb_*.v` testbench to your Vivado project.
2. *Note for structural designs:* Ensure all sub-modules (like `mux_2x1_gate.v` or `d_ff.v`) are also added to the simulation sources.
3. Right-click the testbench in the Hierarchy window and select **Set as Top**.
4. Click **Run Simulation** -> **Run Behavioral Simulation**.