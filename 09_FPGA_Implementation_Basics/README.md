# FPGA Implementation Basics

This module covers deploying Verilog RTL onto physical FPGA hardware targeting the Xilinx Basys 3 board. The examples build on the earlier logic modules and show how synchronous logic can be mapped into a real hardware target.

## Files

### Half adder deployment
- `HA_gate.v` — Gate-level half adder (`a`, `b`, `sum`, `carry`).
- `HA_data_basys.xdc` — Basys 3 constraints mapping `a` (`V17`), `b` (`V16`), `sum` (`U16`), and `carry` (`E19`) using `LVCMOS33`.
- `HA_gate.bit` — Compiled binary bitstream ready to program onto the Basys 3 FPGA.

### 4-bit ripple carry adder and 7-segment display
- `RCA_4bit.v` — 4-bit ripple carry adder instantiating `FA_data`.
- `RCA_4_bit_7seg.v` — Top-level 4-bit RCA driving an active-low common-anode 7-segment display (`an = 4'b1110`, `seg[6:0]`) and `Cout` LED.
- `RCA_7_seg.xdc` — Basys 3 constraints for switches `A[3:0]`, `B[3:0]`, `C`, LED `Cout`, and 7-segment pins `seg[6:0]` / `an[3:0]`.

### Reference template
- `Basys3_Master.xdc` — Official Basys 3 master constraint template used by uncommenting and renaming only the required ports.

## Vivado hardware flow

1. **Constraints (`.xdc`):** Uncomment and map the required ports in a single active `.xdc` file per project.
2. **Synthesis:** Translate RTL into gates and map them onto the FPGA’s CLBs and LUTs after verifying simulation waveforms.
3. **Implementation:** Place logic onto physical sites and route programmable interconnects using the same active `.xdc` and board.
4. **Bitstream generation:** Compile the routed design into `ModuleName.bit` (ensuring no spaces in the project path).
5. **Hardware manager:** Connect the Basys 3 over USB and program the `.bit` file onto the device.

