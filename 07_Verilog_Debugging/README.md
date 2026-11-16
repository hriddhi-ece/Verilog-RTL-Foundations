# Verilog Debugging & Synthesizable RTL

This module covers practical ways to diagnose Verilog simulation problems and write RTL that can be mapped to hardware. The testbench may use simulation-only constructs; keep those separate from synthesizable design code.

### 1. Common simulation errors

- **Syntax errors:** Check punctuation, `begin`/`end` pairing, signal declarations, and Verilog keywords.
- **Compilation/elaboration errors:** Check module names, source files, port names, and port widths. A testbench and design that compile separately may still fail when their module interfaces do not match.
- **Simulation/runtime issues:** Check clock generation, reset polarity and timing, input initialization, and whether the testbench waits long enough to observe the expected clock edges. Unknown (`X`) values often indicate incomplete stimulus or missing resets.
- **Waveform surprises:** Confirm the testbench is the simulation top, all required modules are included, and the observed signals are the intended top-level signals.

### 2. Writing a useful debugging request

Include enough context to reproduce and diagnose the problem:

1. The exact error or warning text, copied verbatim.
2. The simulator or tool and version (for example, Vivado or ModelSim), plus the action that produced the message.
3. Whether the issue occurs during parsing, elaboration, simulation, or synthesis.
4. The smallest relevant design module and its testbench, including port declarations and any dependent modules.
5. The expected behavior, observed behavior, and the input/clock/reset conditions at the time of failure.

A specific report such as “Vivado behavioral simulation reports a width mismatch on port `data`; this is the module and testbench, and I expected…” is much more actionable than “My code is not working.”

### 3. Synthesizable RTL

Synthesizable RTL describes hardware that a synthesis tool can implement as gates, multiplexers, and storage elements, subject to the target device and tool constraints. Constructs such as `#` delays and `forever` loops are useful in testbenches but not in synthesizable RTL.

- Use edge-triggered processes for flip-flops and combinational processes that assign every output on every path. Incomplete assignments in combinational logic can infer latches unintentionally.
- Use nonblocking assignments (`<=`) for sequential state updates. Use blocking assignments (`=`) for combinational procedural calculations, with care to avoid simulation-order surprises.
- Use complete sensitivity lists in Verilog, commonly `always @*`, or use SystemVerilog `always_comb`. Use `always_ff` for sequential logic when writing SystemVerilog.
- Describe reset behavior explicitly and consistently with the intended synchronous or asynchronous reset.
- Avoid `initial` blocks for portable ASIC RTL. FPGA synthesis tools may support initialization for some targets, but this is device- and flow-dependent; use an explicit reset where the design requires one.
- Read synthesis warnings as well as errors; warnings can reveal inferred latches, undriven signals, width mismatches, or unused logic.

### Synthesizability checklist

- Remove simulation delays and testbench-only tasks from synthesizable RTL.
- Check that combinational assignments are complete and sequential assignments use the intended clock edge.
- Verify reset polarity, timing, and priority.
- Check module interfaces and vector widths at every instance.
- Run synthesis for the target in Vivado, Quartus, or the intended tool, then review warnings and inferred hardware.

### Scope

This folder contains documentation for the debugging and RTL practices in this module. The examples above are general guidance; no dedicated design or testbench files are currently included in this folder.

