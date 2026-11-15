# VLSI Learning Log & Lab Notes

This is my personal engineering notebook for the Internshala VLSI course. I use this file to jot down theoretical concepts, synthesis behaviors I notice in Vivado, and verification results as I build out the modules. 

The main goal right now is getting completely comfortable with Gate-Level, Dataflow, Structural, and Behavioral RTL modeling before tackling the larger projects.

---

## Module 2 (Part B): Hardware Data Types & Syntax

### Nets vs. Procedural Variables
* **`wire`:** Think of this as an actual physical copper wire. It can't store memory. It has to be continuously driven by something (like an `assign` statement or the output of another module).
* **`reg`:** This is a procedural variable used inside `always` or `initial` blocks. The tricky part? Just because it's called `reg` doesn't mean it always becomes a hardware register (flip-flop). Depending on how you write the code, Vivado might turn it into a flip-flop, a latch, or just plain combinational logic.

### Loops in Hardware
* **Synthesizable (`for`):** You can use `for` loops in RTL, but only if the start and end points are fixed numbers. The synthesizer essentially "unrolls" the loop and copy-pastes the hardware gates side-by-side. 
* **Not Synthesizable (`while`, `forever`):** Dynamic loops usually can't be synthesized into physical hardware because the compiler doesn't know how many gates to build. I only use `forever` loops inside testbenches to generate clock signals.

### Operators
* **Concatenation `{}`:** Super useful for bundling individual signals into a bus. Example: `assign {cout, sum} = a + b;`
* **Bitwise vs. Logical:** `&` and `|` map directly to physical AND/OR gates for every bit in a wire. `&&` and `||` just return a simple True/False (1/0), mostly used for `if` conditions.

---

## Module 2 (Part A): Multiplexers (`02_Multiplexers/`)

**What I built:** A 2-to-1 Multiplexer (`MUX_2x1.v`).
**Style:** Behavioral modeling using an `always @*` block and `if-else` routing.

**Notes on Synthesis:** 
Using an `if-else` block inside combinational logic works perfectly. Vivado recognizes the pattern and infers a dedicated hardware multiplexer rather than trying to build it out of generic logic gates.

**Verification:** 
I started by testing the select-line using manual GUI Force Clocks, but quickly moved to writing an automated testbench (`tb_MUX_2x1.v`). Using `$monitor` let me print the truth table directly to the console every time the inputs changed.

*(2x1 MUX RTL Schematic & Simulation Waveform)*
![2x1 MUX Schematic](02_Multiplexers/images/MUX_2x1_SCHEMATIC.png)
![2x1 MUX Waveform](02_Multiplexers/images/MUX_2x1_SIM.png)

---

## Modules 1 & 3: Combinational Arithmetic (`01_Adders_basics/`)

**What I built:** Half Adders and Full Adders using four completely different abstraction levels to see how the compiler handles them.
* **Gate-Level:** Wired up raw `xor`, `and`, and `or` primitives (`HA_gate.v`, `fa_gate.v`).
* **Dataflow:** Used arithmetic concatenation and continuous `assign` statements (`FA_data.v`).
* **Structural:** Built a Full Adder by instantiating two Half Adders and wiring their internal nets together (`FA_using_HA.v`).
* **Behavioral:** Built adders by giving the compiler the truth table via `case` and `if-else` statements (`HA_case.v`, `fa_case.v`, `fa_if.v`). 

**Notes on Synthesis:**
* **Abstraction doesn't change the waveform:** Whether I manually wired the gates or just wrote a behavioral `case` statement, the simulation waveforms looked exactly the same. The difference is only visible in the RTL Schematics.
* **The missing `default` danger:** When writing `fa_case.v`, I realized that if you leave out the `default` fallback in a `case` statement, Vivado panics and injects memory latches to hold the previous state. I had to ensure every possible input combination was accounted for to keep the circuit strictly combinational.

**Verification:**
I have completely transitioned from manual GUI Force Clocks to automated testbenches. My simulation files (like `tb_fa_case.v`) use `#10` nanosecond delays to step through inputs, generating exhaustive, repeatable truth tables in the console.

### Visual Artifacts

*(Manual Force Clock Configuration & Truth Table Reference)*
![Force Clock Settings](01_Adders_basics/images/FA_force_clocks.png)
![Truth Table](01_Adders_basics/images/FA_truth_table.png)

*(Full Adder: Synthesized RTL Schematic & Validated Waveform)*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)
![Full Adder Waveform](01_Adders_basics/images/FA_truthtable_waveform.png)

*(Half Adder via Case Statement: Synthesized LUT/MUX Schematic & Waveform)*
![Half Adder Case Schematic](01_Adders_basics/images/HA_case_schematic.png)
![Half Adder Case Waveform](01_Adders_basics/images/HA_case_sim.png)

*(Full Adder via Case Statement: Synthesized Schematic & Waveform)*
![Full Adder Case Schematic](01_Adders_basics/images/fa_case_schematic.png)
![Full Adder Case Waveform](01_Adders_basics/images/fa_case_sim.png)

*(Full Adder via Gate Primitives: Synthesized Schematic & Waveform)*
![Full Adder Gate Schematic](01_Adders_basics/images/fa_gate_schematic.png)
![Full Adder Gate Waveform](01_Adders_basics/images/fa_gate_sim.png)

*(Full Adder via If-Else Routing: Synthesized Schematic & Waveform)*
![Full Adder If-Else Schematic](01_Adders_basics/images/fa_if_schematic.png)
![Full Adder If-Else Waveform](01_Adders_basics/images/fa_if_sim.png)