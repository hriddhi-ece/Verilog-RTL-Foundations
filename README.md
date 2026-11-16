# Verilog RTL Foundations

**Status:** Active learning and portfolio project  
**Author:** Hriddhi Bhattacharyya — ECE, Netaji Subhash Engineering College

This repository is a hands-on introduction to Verilog HDL and RTL design. It covers both combinational and sequential hardware using compact, focused examples to illustrate how logic is described, simulated, and mapped into real hardware.

The goal is to build hardware intuition: Verilog RTL models logic that can be synthesized into gates, lookup tables, and multiplexers, rather than a sequence of software instructions.

## Visual preview

*Full-adder schematic generated in Vivado from the RTL.*

![Full-adder schematic](01_Adders_basics/images/FA_schematic.png)

## Repository structure

- [`01_Adders_basics/`](./01_Adders_basics/) — Half adders, full adders, and a 4-bit ripple-carry adder.
- [`02_Multiplexers/`](./02_Multiplexers/) — 2-to-1 and 4-to-1 multiplexers in behavioral, dataflow, gate-level, and structural styles.
- [`03_Decoders_Demux/`](./03_Decoders_Demux/) — 1-to-4 demultiplexer, 2-to-4 decoders, a structural 3-to-8 decoder, and a decoder-based Boolean function.
- [`04_Code_Converters/`](./04_Code_Converters/) — Gray-to-binary conversion using `case`-based and XOR-based logic.
- [`05_Comparators/`](./05_Comparators/) — One-bit magnitude comparator.
- [`06_Sequential_Logic_Basics/`](./06_Sequential_Logic_Basics/) — SR latch, D/T/JK flip-flops, shift registers, and counters.
- [`07_Verilog_Debugging/`](./07_Verilog_Debugging/) — Debugging strategy, simulation practices, and synthesizable RTL guidance.
- [`08_Finite_State_Machines/`](./08_Finite_State_Machines/) — Moore and Mealy FSMs for counters and sequence detection.
- [`09_FPGA_Implementation_Basics/`](./09_FPGA_Implementation_Basics/) — Basys 3 constraints, bitstream generation, and 7-segment display interfacing.
- [`10_RTL_Mini_Projects/`](./10_RTL_Mini_Projects/) — Applied mini-projects including parking count logic, vending machine control, and a traffic-light FSM.
- [`LEARNING_LOG.md`](./LEARNING_LOG.md) — Detailed learning notes linking circuits to RTL concepts and FPGA implementation flow.

## Verification

The included testbenches apply input patterns and use `$monitor` to print signal values. These outputs are useful for visual truth-table inspection, but they are not self-checking assertions by themselves. For more rigorous verification, a design should be extended with automated checks or waveform review.

## How to run locally

Clone the repository:

```bash
git clone https://github.com/hriddhi-ece/Verilog-RTL-Foundations.git
cd Verilog-RTL-Foundations
```

The project examples are organized for AMD Vivado behavioral simulation. Add a design file and its corresponding `tb_*.v` testbench as simulation sources, set the testbench as the top module, and run behavioral simulation. Then review the generated waveforms and, if needed, move to synthesis and implementation.

