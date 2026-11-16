# Verilog RTL Foundations

**Status:** Active learning and portfolio project  
**Author:** Hriddhi Bhattacharyya — ECE, Netaji Subhash Engineering College

This repository is a hands-on introduction to Verilog HDL and RTL design. It covers both combinational and sequential hardware, using small, focused examples to show how logic can be described and simulated in behavioral, dataflow, gate-level, and structural styles.

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
- [`06_Sequential_Logic_Basics/`](./06_Sequential_Logic_Basics/) — SR latch, D/T/JK flip-flops, shift registers, and basic counters.
- [`07_Verilog_Debugging/`](./07_Verilog_Debugging/) — Guidelines for debugging, simulation tracking, and writing synthesizable RTL.
- [`08_Finite_State_Machines/`](./08_Finite_State_Machines/) — Moore and Mealy FSMs for counters and pattern detection.
- [`09_FPGA_Implementation_Basics/`](./09_FPGA_Implementation_Basics/) — Basys 3 XDC constraints, Half Adder bitstream, and 4-bit RCA with 7-segment display.
| [`10_RTL_Mini_Projects/`](10_RTL_Mini_Projects/) | Applied Verilog mini-projects: 8-slot car parking counter with Nexys 4 DDR 7-segment display, FSM vending machine, and 4-way traffic light controller. |
- [`LEARNING_LOG.md`](./LEARNING_LOG.md) — Explanations of the RTL concepts and figures demonstrated by the examples.

## Verification

The included testbenches apply input patterns and use `$monitor` to display signal values. These outputs are useful for visual truth-table inspection; they are not self-checking assertions. Self-checking assertions can be added later for automated verification.

## How to run locally

Clone the repository:

```bash
git clone https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git
cd Verilog-RTL-Foundations
```

The project examples are organized for Vivado behavioral simulation. Add a design file and its corresponding `tb_*.v` testbench as simulation sources, set the testbench as the simulation top, and run behavioral simulation.
