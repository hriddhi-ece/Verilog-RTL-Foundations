# Verilog RTL Foundations 🛠️

*Current Status: Active / Ongoing (Currently mastering Loops & Procedural Constructs)*

A hands-on, actively growing hardware design portfolio documenting my progression through the Internshala VLSI course. All digital circuits are manually coded, synthesized, and verified using **Verilog HDL** and **AMD/Xilinx Vivado**.

### 📸 Visual Preview: Full Adder RTL Synthesis
*Generated directly from Vivado after implementing structural and behavioral modeling.*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)
*(See `LEARNING_LOG.md` for complete simulation waveforms and case logic schematics)*

### ✨ Current Capabilities & Features
* **Multi-Paradigm Modeling:** Implementations of digital logic using Gate-Level, Dataflow, Structural, and Behavioral modeling techniques.
* **Combinational Arithmetic (`01_Adders_basics/`):** Custom Half Adders and Full Adders built from fundamental gates up to procedural `case` statements.
* **Multiplexer Architectures (`02_Multiplexers/`):** 2-to-1 Multiplexers designed using conditional routing (`if-else`).
* **Testbench-Free Verification:** Automated truth table validation using Vivado's `Force Clock` GUI methodology to cycle through all binary states.

### 🧠 Core Engineering Takeaways
* **Hardware vs. Software Syntax:** Learned to treat Verilog as physical hardware generation. Procedural `case` statements don't just execute code; they instruct the Vivado synthesizer to infer actual Look-Up Tables (LUTs) and Multiplexers.
* **Avoiding the Latch Trap:** Discovered that omitting a `default` fallback in a combinational `case` block causes the synthesizer to inject unintentional memory latches, ruining timing closures. 
* **Signal Types & Assignments:** Mastered the physical difference between driving `wire` nets via continuous assignments outside procedural blocks, versus driving `reg` data types inside clocked/triggered `always` blocks.

### 🚀 Quick Setup
1. Clone this repository: `git clone https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git`
2. Open the `.v` source files in **AMD Vivado**.
3. Run **RTL Analysis** to generate the schematics, or launch **Simulation** and apply Force Clocks to the input nodes to verify the waveforms.

---
**Detailed Module Notes:** For a complete, chronological breakdown of my daily progress, methodology, and all simulation waveforms across all modules, check out my [LEARNING_LOG.md](./LEARNING_LOG.md).