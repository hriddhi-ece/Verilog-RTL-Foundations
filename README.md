# Verilog RTL Foundations

**Current Status:** Active (Currently working through core HDL theory and combinational circuits).

This repository contains my Verilog HDL coursework and hardware design portfolio. It focuses on taking fundamental digital logic concepts and writing synthesizable RTL. All circuits are manually coded, synthesized, and verified to see exactly how different coding styles translate into physical FPGA hardware. 

### Visual Preview
*Full Adder Schematic generated directly from Vivado RTL Analysis.*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)

### Repository Structure
* **[`01_Adders_basics/`](./01_Adders_basics/)**: Half and Full Adders built across four different abstraction levels: Gate-Level, Dataflow, Structural, and Behavioral.
* **[`02_Multiplexers/`](./02_Multiplexers/)**: 2-to-1 MUX designs using conditional `if-else` routing.
* **[`LEARNING_LOG.md`](./LEARNING_LOG.md)**: My detailed engineering notebook. Read this for my notes on hardware data types, synthesis observations (like avoiding combinational latches), and full waveform screenshots.

### Tools & Verification
* **Environment:** AMD/Xilinx Vivado, GitHub Desktop.
* **Verification Methods:** I use a mix of visual checks using Vivado's GUI **Force Clocks** and automated **Verilog testbenches** (using `$monitor` to print exhaustive truth tables to the console). I am currently upgrading the testbenches to use self-checking PASS/FAIL assertions.

### How to Run Locally
1. Clone the repository:
   ```bash
   git clone [https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git](https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git)