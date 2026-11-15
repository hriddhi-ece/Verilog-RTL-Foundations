# Verilog RTL Foundations

**Status:** Active Learning & Fresher Portfolio 
**Author:** Hriddhi Bhattacharyya (ECE, Netaji Subhash Engineering College)
**Contact:** hriddhibhattacharyya239@gmail.com

This repository is my personal engineering workspace for mastering Verilog HDL and RTL design. Rather than uploading a massive, unverified ASIC project, I built this to document a strict, fundamental progression from digital logic theory to synthesizable hardware using AMD/Xilinx Vivado.

It is designed to demonstrate "hardware thinking"—writing Verilog not as sequential software, but as a description of physical gates, LUTs, and multiplexers.

### Visual Preview
*Full Adder Schematic synthesized directly from behavioral RTL in Vivado.*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)

## Repository Structure

* **[`01_Adders_basics/`](./01_Adders_basics/)**: Half Adders, Full Adders, and a 4-bit Ripple Carry Adder.
* **[`02_Multiplexers/`](./02_Multiplexers/)**: 2-to-1 and 4-to-1 MUX implementations comparing behavioral, dataflow, and gate-level styles.
* **[`03_Decoders_Demux/`](./03_Decoders_Demux/)**: 1x4 Demux, 2x4 Decoders, and a structural 3x8 Decoder. Demonstrates using decoders for Boolean function implementation.
* **[`04_Code_Converters/`](./04_Code_Converters/)**: Gray-to-Binary converters built with procedural `case` statements and dataflow XOR logic.
* **[`05_Comparators/`](./05_Comparators/)**: 1-bit Magnitude Comparator.
* **[`LEARNING_LOG.md`](./LEARNING_LOG.md)**: A continuous log of synthesis observations, hardware inference theory, and bug-fixing notes.

### Verification Approach

I verify logic functionality through a progression of methods:
1. **Visual Validation:** Initial truth-table checks using Vivado's GUI Force Clocks.
2. **Automated Testbenches:** Custom `tb_*.v` files utilizing `$monitor` to print exhaustive truth tables directly to the console.
3. **Next Steps:** Upgrading testbenches to use self-checking `PASS/FAIL` assertions for better regression testing.

### How to Run Locally

1. Clone the repository:
   ```bash
   git clone [https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git](https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git)