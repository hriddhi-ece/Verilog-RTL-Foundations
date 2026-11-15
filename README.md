# Verilog RTL Foundations

**Status:** Active learning and portfolio project  
**Author:** Hriddhi Bhattacharyya — ECE, Netaji Subhash Engineering College

This repository is a hands-on introduction to Verilog HDL and RTL design. It focuses on small combinational circuits and demonstrates how to describe hardware using behavioral, dataflow, gate-level, and structural modeling styles.

The goal is to build hardware intuition: Verilog RTL describes logic that can be synthesized into gates, lookup tables, and multiplexers—not a sequence of software instructions.

## Visual preview

*Full-adder schematic generated in Vivado from the RTL.*

![Full-adder schematic](01_Adders_basics/images/FA_schematic.png)

## Repository structure

- [`01_Adders_basics/`](./01_Adders_basics/) — Half adders, full adders, and a 4-bit ripple-carry adder.
- [`02_Multiplexers/`](./02_Multiplexers/) — 2-to-1 and 4-to-1 multiplexers in behavioral, dataflow, gate-level, and structural styles.
- [`03_Decoders_Demux/`](./03_Decoders_Demux/) — A 1-to-4 demultiplexer, 2-to-4 decoders, a structural 3-to-8 decoder, and a decoder-based Boolean function.
- [`04_Code_Converters/`](./04_Code_Converters/) — Gray-to-binary conversion using `case` and dataflow XOR logic.
- [`05_Comparators/`](./05_Comparators/) — A one-bit magnitude comparator.
- [`LEARNING_LOG.md`](./LEARNING_LOG.md) — Explanations of the RTL concepts and figures demonstrated by the examples.

## Verification

The included testbenches apply input patterns and use `$monitor` to display signal values. These outputs are useful for visual truth-table inspection; they are not self-checking assertions. Self-checking `PASS`/`FAIL` tests and automated regression are potential next steps.

## How to run locally

Clone the repository:

```bash
git clone https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git
cd Verilog-RTL-Foundations
```

The project examples are organized for Vivado behavioral simulation. Add a design file and its corresponding `tb_*.v` testbench as simulation sources, set the testbench as the simulation top, and run **Run Behavioral Simulation**. For structural designs, include the dependent module files as well.
