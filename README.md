# Verilog RTL Foundations

**Status:** Active Learning & Fresher Portfolio 
**Author:** Hriddhi Bhattacharyya (ECE, Netaji Subhash Engineering College)
**Contact:** hriddhibhattacharyya239@gmail.com

This repository is my personal engineering workspace for mastering Verilog HDL and RTL design. Rather than uploading a massive, unverified ASIC project, I built this to document a strict, fundamental progression from digital logic theory to synthesizable hardware using AMD/Xilinx Vivado.

It is designed to demonstrate "hardware thinking"—writing Verilog not as sequential software, but as a description of physical gates, LUTs, and multiplexers.

### Visual Preview
*Full Adder Schematic synthesized directly from behavioral RTL in Vivado.*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)

### Repository Structure

*(Course modules are appended below as they are completed)*

* **[`01_Adders_basics/`](./01_Adders_basics/)**: Half Adders, Full Adders, and a 4-bit RCA built across Gate-Level, Dataflow, Structural, and Behavioral abstractions.
* **[`02_Multiplexers/`](./02_Multiplexers/)**: 2-to-1 MUX designs demonstrating Gate-Level, Dataflow, and conditional `if-else` Behavioral routing.
* **[`LEARNING_LOG.md`](./LEARNING_LOG.md)**: My detailed lab notebook. Read this for my notes on hardware data types, synthesis observations, and full waveform screenshots.

### Verification Approach

I verify logic functionality through a progression of methods:
1. **Visual Validation:** Initial truth-table checks using Vivado's GUI Force Clocks.
2. **Automated Testbenches:** Custom `tb_*.v` files utilizing `$monitor` to print exhaustive truth tables directly to the console.
3. **Next Steps:** Upgrading testbenches to use self-checking `PASS/FAIL` assertions for better regression testing.

### How to Run Locally

1. Clone the repository:
   ```bash
   git clone [https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git](https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git)