# Verilog RTL Foundations

**Current Status:** Active (Currently working through core HDL theory. Practical assignments like the 8-bit ALU are scheduled for later).

I put this repository together to document my progress through the Internshala VLSI course. Instead of just dumping code, I'm using this space to track how different Verilog coding styles actually translate into synthesized hardware in AMD Vivado. 

All the digital circuits here are manually coded, synthesized, and verified by me.

### A Quick Look: RTL Synthesis
Here is an example of a Full Adder synthesized directly from my RTL code:

![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)
*(You can find the rest of the simulation waveforms and schematics in my learning log).*

### What's Inside
* **Combinational Arithmetic (`01_Adders_basics/`):** A collection of Half and Full Adders. I built these multiple ways—starting from raw gate primitives, moving to continuous assignments, and finally using procedural `case` and `if-else` blocks to see how Vivado handles them.
* **Multiplexers (`02_Multiplexers/`):** 2-to-1 MUX designs using conditional routing.
* **Automated Testbenches:** I moved away from manually clicking through Vivado's GUI Force Clocks and started writing exhaustively automated Verilog testbenches (using `$monitor`) to validate truth tables directly in the console.

### Key Things I've Learned So Far
* **Verilog isn't Software:** Writing a `case` statement in Verilog doesn't just run code in sequence; it literally tells the Vivado synthesizer to wire up physical Look-Up Tables (LUTs) and multiplexers on the FPGA.
* **The Latch Trap:** If you forget to include a `default` condition in a combinational `case` block, the synthesizer will try to hold the previous value by injecting unintentional memory latches. This ruins combinational timing.
* **Nets vs. Variables:** Figuring out exactly when to use a `wire` (driven continuously outside a block) versus a `reg` (driven inside a triggered `always` block) has been the biggest mental shift.

### How to Run This Code
1. Clone the repo: `git clone https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git`
2. Open any `.v` source file and its matching `tb_` testbench file in AMD Vivado.
3. Run **RTL Analysis** to see the hardware schematic, or launch **Simulation** to watch the testbench automatically print the truth table.

---
**Detailed Notes:** If you want to see my actual lab notes, synthesis observations, and all the waveform screenshots, check out my [LEARNING_LOG.md](./LEARNING_LOG.md).