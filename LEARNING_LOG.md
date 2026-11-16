# Verilog RTL Learning Log

This log connects the circuits in this repository to the RTL concepts they demonstrate. It starts with combinational logic, where outputs depend only on current inputs, and moves into sequential logic, where clocked state preserves information across time. The final section collects practical debugging and synthesizable RTL guidelines.

## Table of Contents

1. [VLSI, FPGA, and RTL](#vlsi-fpga-and-rtl)
2. [Adders — `01_Adders_basics/`](#1-adders--01_adders_basics)
3. [Multiplexers — `02_Multiplexers/`](#2-multiplexers--02_multiplexers)
4. [Demultiplexers and decoders — `03_Decoders_Demux/`](#3-demultiplexers-and-decoders--03_decoders_demux)
5. [Gray-to-binary conversion — `04_Code_Converters/`](#4-gray-to-binary-conversion--04_code_converters)
6. [One-bit magnitude comparator — `05_Comparators/`](#5-one-bit-magnitude-comparator--05_comparators)
7. [Sequential logic, registers, and counters — `06_Sequential_Logic_Basics/`](#6-sequential-logic-registers-and-counters--06_sequential_logic_basics)
8. [Verilog debugging and synthesizable RTL — `07_Verilog_Debugging/`](#7-verilog-debugging-and-synthesizable-rtl--07_verilog_debugging)
9. [Finite state machines — `08_Finite_State_Machines/`](#8-finite-state-machines--08_finite_state_machines)
10. [Scope and next work](#scope-and-next-work)

---

## VLSI, FPGA, and RTL

VLSI design spans the path from defining a circuit's behavior to implementing and verifying it. In this repository, the focus is on Register Transfer Level (RTL) modeling and behavioral simulation. An FPGA implements logic using configurable hardware resources, while RTL describes the intended data flow and state behavior before synthesis maps it to gates and flip-flops.

Verilog models concurrent hardware behavior rather than a sequence of software instructions:

- **`wire` vs. `reg`:** A `wire` is a net driven by a continuous assignment (`assign`), a module output, or a primitive gate. A `reg` is a procedural variable; declaring a signal as `reg` does not by itself imply a hardware flip-flop. An `output reg` assigned inside an edge-triggered `always` block models clocked storage, whereas an `output reg` assigned across all paths in an `always @*` block models purely combinational logic. Both continuous `assign` statements and `always @*` procedural blocks are valid ways to express combinational and dataflow behavior.
- **Continuous vs. procedural assignments:** `assign` continuously drives a net whenever its right-hand side changes. Procedural assignments (`=` or `<=`) live inside `always` or `initial` blocks.
- **Blocking (`=`) vs. nonblocking (`<=`):** Blocking assignment (`=`) updates immediately in procedural order and suits combinational calculations. Nonblocking assignment (`<=`) schedules updates for the end of the current simulation time step and is the standard choice for sequential clocked logic to avoid race conditions.
- **Four-state simulation values:** Simulation uses `0`, `1`, `X` (unknown or conflicting drivers), and `Z` (high impedance). Unexpected `X` values often point to uninitialized registers or incomplete testbench stimulus, while `Z` is mainly used for modeling tri-state buses.
- **Operators:** Bitwise operators (`&`, `|`, `^`) operate bit by bit, whereas logical operators (`&&`, `||`) evaluate to a single Boolean result. Case equality (`===`, `!==`) compares `X` and `Z` explicitly, which is helpful in testbenches and debugging.
- **Structural RTL:** Larger modules are built by instantiating smaller ones. Using explicit named port mapping (for example, `.E(E)`) makes module connections clearer and reduces wiring mistakes compared to positional mapping.

### Combinational logic and verification workflow

In a combinational `always @*` block, every output should be assigned along every execution path. If an `if` or `case` branch omits an assignment, the signal must retain its previous value, which can cause synthesis tools to infer an unintended latch. Complete branch coverage or a `default` assignment helps keep the logic purely combinational.

The `tb_*.v` testbenches in this repository use **automated stimulus generation** and **print-based verification** via `$monitor` to log signal changes alongside waveform inspection. While printed truth tables and waveforms make visual inspection straightforward, they do not automatically flag mismatches; adding self-checking testbenches with automated pass/fail assertions is a natural next step.

In Vivado, the standard workflow is to add both the design module and its testbench as simulation sources, set the testbench as the simulation top, and run behavioral simulation. Behavioral simulation checks functional logic; synthesis is a separate step that maps supported RTL onto target hardware.

---

## 1. Adders — `01_Adders_basics/`

A half adder sums two 1-bit inputs: `sum = a ^ b` and `carry = a & b`. A full adder includes a third carry-in input (`cin`), where `sum` is the XOR of all three inputs and `carry` goes high whenever at least two inputs are high.

`rca_4bit.v` chains four full-adder instances structurally. Each stage's `cout` feeds the next stage's `cin` from the least significant bit (LSB) to the most significant bit (MSB). This structure illustrates carry propagation and shows why the final carry-out is needed to represent arithmetic overflow beyond 4 bits (such as `15 + 1` or `15 + 15`).

### Figures

#### Figure 1: Vivado force-clock setup for the full adder
*Vivado Force Clock setup driving `a`, `b`, and `cin` with staggered periods to sweep all input patterns.*

[01_Adders_basics/images/FA_force_clocks.png]

#### Figure 2: Full-adder truth table
*Reference truth table listing all eight 3-bit input combinations and their expected `sum` and `cout` outputs.*

[01_Adders_basics/images/FA_truth_table.png]

#### Figure 3: Full-adder RTL schematic
*Full-adder schematic generated in Vivado from the RTL.*

[01_Adders_basics/images/FA_schematic.png]

#### Figure 4: Full-adder simulation waveform
*Behavioral waveform confirming `sum` and `cout` transitions across all eight combinations of `a`, `b`, and `cin`.*

[01_Adders_basics/images/FA_truthtable_waveform.png]

#### Figure 5: Half-adder `case` implementation schematic
*Elaborated schematic of the half adder written with a procedural `case` block inside `always @*`.*

[01_Adders_basics/images/HA_case_schematic.png]

#### Figure 6: Half-adder `case` simulation
*Simulation waveform verifying `sum` and `carry` across all four 2-bit input combinations.*

[01_Adders_basics/images/HA_case_sim.png]

#### Figure 7: Full-adder `case` implementation schematic
*Elaborated schematic of the full adder modeled with a 3-bit `case ({a, b, cin})` lookup.*

[01_Adders_basics/images/fa_case_schematic.png]

#### Figure 8: Full-adder `case` simulation
*Simulation waveform checking the `case`-based full adder against all eight input combinations.*

[01_Adders_basics/images/fa_case_sim.png]

#### Figure 9: Gate-level full-adder schematic
*Structural gate-level schematic built directly from primitive `xor`, `and`, and `or` instances.*

[01_Adders_basics/images/fa_gate_schematic.png]

#### Figure 10: Gate-level full-adder simulation
*Simulation waveform confirming identical `sum` and `cout` behavior to the behavioral full-adder models.*

[01_Adders_basics/images/fa_gate_sim.png]

#### Figure 11: Full-adder `if-else` implementation schematic
*Elaborated schematic of the full adder expressed using `if-else` branching inside `always @*`.*

[01_Adders_basics/images/fa_if_schematic.png]

#### Figure 12: Full-adder `if-else` simulation
*Simulation waveform verifying that all `if-else` branches resolve cleanly without latch inference.*

[01_Adders_basics/images/fa_if_sim.png]

#### Figure 13: 4-bit ripple-carry adder schematic
*Structural 4-bit ripple-carry adder (`rca_4bit.v`) showing four cascaded full-adder stages from LSB to MSB.*

[01_Adders_basics/images/rca_4bit_schematic.png]

#### Figure 14: 4-bit ripple-carry adder simulation
*Simulation waveform highlighting 4-bit addition and final `cout` overflow cases such as `15 + 1` and `15 + 15`.*

[01_Adders_basics/images/rca_4bit_sim.png]

---

## 2. Multiplexers — `02_Multiplexers/`

A 2-to-1 multiplexer routes one of two inputs to its output: `y = (~s & i0) | (s & i1)`. When `s` is `0`, `y` follows `i0`; when `s` is `1`, `y` follows `i1`. `MUX_2x1.v`, `MUX_2x1_gate.v`, and `MUX2x1_data.v` express this same selection logic across behavioral (`always @*` with `output reg`), gate-level, and dataflow modeling styles.

`mux_4x1.v` builds a 4-to-1 MUX structurally from three 2-to-1 instances: `s0` selects within each input pair, and `s1` chooses between the two intermediate outputs.

### Figures

#### Figure 15: Behavioral 2-to-1 MUX schematic
*Elaborated `RTL_MUX` schematic generated from the behavioral 2-to-1 multiplexer (`MUX_2x1.v`).*

[02_Multiplexers/images/MUX_2x1_SCHEMATIC.png]

#### Figure 16: Behavioral 2-to-1 MUX simulation
*Simulation waveform showing output `y` tracking `i0` when `s = 0` and switching to `i1` when `s = 1`.*

[02_Multiplexers/images/MUX_2x1_SIM.png]

#### Figure 17: Gate-level 2-to-1 MUX schematic
*Gate-level schematic of `MUX_2x1_gate.v` showing the explicit `not`, `and`, and `or` sum-of-products network.*

[02_Multiplexers/images/MUX_2x1_gate_schematic.png]

#### Figure 18: Gate-level 2-to-1 MUX simulation
*Simulation waveform confirming that the gate-level 2-to-1 MUX matches the behavioral selector.*

[02_Multiplexers/images/MUX_2x1_gate_sim.png]

#### Figure 19: Dataflow 2-to-1 MUX schematic
*Elaborated schematic of `MUX2x1_data.v` expressing the 2-to-1 selection equation in dataflow style.*

[02_Multiplexers/images/MUX2x1_data_schematic.png]

#### Figure 20: Dataflow 2-to-1 MUX simulation
*Simulation waveform verifying clean routing between `i0` and `i1` across all select transitions.*

[02_Multiplexers/images/MUX2x1_data_sim.png]

#### Figure 21: 4-to-1 MUX hierarchical schematic
*Hierarchical schematic of `mux_4x1.v` built from three 2-to-1 MUX instances in a two-level tree.*

[02_Multiplexers/images/mux_4x1_schematic.png]

#### Figure 22: 4-to-1 MUX simulation
*Simulation waveform stepping `s[1:0]` from `00` to `11` to verify each of the four routed input channels.*

[02_Multiplexers/images/mux_4x1_sim.png]

---

## 3. Demultiplexers and decoders — `03_Decoders_Demux/`

A 1-to-4 demultiplexer routes a single data input to one of four outputs based on two select bits. A 2-to-4 decoder performs a related function by asserting one active output corresponding to a 2-bit input code.

`dec_3to8.v` expands this concept structurally by combining two enabled 2-to-4 decoders to produce eight one-hot outputs. `func_decoder.v` shows how decoder outputs (minterms) can be ORed together to implement an arbitrary Boolean function.

### Figures

#### Figure 23: 1-to-4 demultiplexer schematic
*Elaborated schematic showing select-line decoding gating a single input `d` onto four output channels.*

[03_Decoders_Demux/images/demux_1x4_schematic.png]

#### Figure 24: 1-to-4 demultiplexer simulation
*Simulation waveform routing `d` to the addressed output channel while the remaining three stay `0`.*

[03_Decoders_Demux/images/demux_1x4_sim.png]

#### Figure 25: 2-to-4 decoder schematic
*Elaborated schematic of the 2-to-4 decoder mapping a 2-bit input code to four one-hot outputs.*

[03_Decoders_Demux/images/dec_2to4_schematic.png]

#### Figure 26: 2-to-4 decoder simulation
*Simulation waveform verifying one-hot output assertion for each 2-bit input code (`00` through `11`).*

[03_Decoders_Demux/images/dec_2to4_sim.png]

#### Figure 27: 3-to-8 decoder structural schematic
*Structural schematic of `dec_3to8.v` combining two enabled 2-to-4 decoders to expand output width to eight lines.*

[03_Decoders_Demux/images/dec_3to8_schematic.png]

#### Figure 28: 3-to-8 decoder simulation
*Simulation waveform sweeping `000` to `111` and producing a clean one-hot staircase across all eight outputs.*

[03_Decoders_Demux/images/dec_3to8_sim.png]

#### Figure 29: Decoder-based Boolean function schematic
*Elaborated schematic of `func_decoder.v` combining selected decoder minterm outputs with OR logic.*

[03_Decoders_Demux/images/func_decoder_schematic.png]

#### Figure 30: Decoder-based Boolean function simulation
*Simulation waveform confirming that output `y` asserts high only on the selected minterms of the target function.*

[03_Decoders_Demux/images/func_decoder_sim.png]

---

## 4. Gray-to-binary conversion — `04_Code_Converters/`

In a reflected Gray-code sequence, adjacent values differ in only one bit. This property helps reduce the risk of sampling an intermediate glitch when multi-bit values cross physical signal boundaries.

For 4-bit Gray-to-binary conversion, the MSB passes through directly and each subsequent binary bit is the XOR of the preceding binary bit and the current Gray bit:

- `B[3] = G[3]`
- `B[2] = B[3] ^ G[2]`
- `B[1] = B[2] ^ G[1]`
- `B[0] = B[1] ^ G[0]`

`gtob_data.v` implements these XOR equations directly, whereas `gtob_case.v` maps all 16 input combinations explicitly with a `default` branch to keep the combinational `case` block complete.

### Figures

#### Figure 31: Gray-to-binary conversion schematic
*Elaborated schematic of `gtob_data.v` showing the three-stage XOR cascade from Gray MSB to binary LSB.*

[04_Code_Converters/images/gtob_data_schematic.png]

#### Figure 32: Gray-to-binary conversion simulation
*Simulation waveform sweeping all 16 four-bit Gray-code inputs and verifying their decoded binary outputs.*

[04_Code_Converters/images/gtob_data_sim.png]

---

## 5. One-bit magnitude comparator — `05_Comparators/`

The 1-bit comparator produces three mutually exclusive outputs:

- `g = a & ~b`: `a` is greater than `b`.
- `e = a ~^ b`: `a` is equal to `b` (XNOR).
- `s = ~a & b`: `a` is smaller than `b`.

For multi-bit unsigned comparators, comparison proceeds from the MSB downward; the first differing bit position determines which operand is larger.

### Figures

#### Figure 33: 1-bit comparator schematic
*Elaborated schematic showing the parallel inverter, AND, and XNOR paths driving `g`, `e`, and `s`.*

[05_Comparators/images/comp_1bit_schematic.png]

#### Figure 34: 1-bit comparator simulation
*Simulation waveform testing all four input pairs (`00`, `01`, `10`, `11`) and confirming mutually exclusive comparison outputs.*

[05_Comparators/images/comp_1bit_sim.png]

---

## 6. Sequential logic, registers, and counters — `06_Sequential_Logic_Basics/`

Unlike combinational circuits, sequential circuits include memory elements that retain past state, forming the basis of registers, counters, RAM, and ROM. Every sequential element relies on a clock or enable trigger to determine when its stored output updates.

### Triggering and storage elements

- **Level-sensitive latch vs. edge-triggered flip-flop:** A latch is transparent while its enable level (high or low) is active and holds its value otherwise. A flip-flop samples inputs and updates state only at a rising (`posedge clk`) or falling (`negedge clk`) clock edge, producing synchronous behavior.
- **SR latch (`sr_latch.v`):** Built from cross-coupled NOR (or NAND) gates. For an active-high NOR latch, `S=1, R=0` sets `Q=1`, `S=0, R=1` resets `Q=0`, `S=R=0` holds `Q`, and `S=R=1` is an invalid state.
- **SR flip-flop (`sr_ff.v`):** Adds clock gating inside `always @(posedge clk)`. Any output assigned inside an `always` block must be declared as `output reg` (assigning to a plain wire causes a procedural assignment error in Vivado). Because `sr_ff.v` omits an explicit branch for `S=R=1`, the clocked process retains (holds) the previous `q` and `qbar` values for that input combination, even though `S=R=1` is conventionally treated as invalid in standard SR logic.
- **D flip-flop (`d_ff.v`, `d_ff_clr.v`):** The simplest flip-flop, capturing `Q <= D` on the active clock edge. `d_ff_clr.v` adds a synchronous `clear` checked on the clock edge.
- **T flip-flop (`t_ff.v`):** Holds `Q` when `T=0` and toggles (`Q <= ~Q`) when `T=1`. Without an explicit reset or simulation initialization (`initial begin Q = 0; end`), `Q` remains unknown (`X`) during simulation.
- **JK flip-flop (`jk_ff.v`):** Modifies the SR flip-flop so that `J=1, K=1` toggles `Q` instead of entering an invalid state, implemented cleanly with `case({J, K})`.

| Storage Element | Triggering | Key Behavior / Special Case |
| :--- | :--- | :--- |
| **SR Latch** | Level-sensitive | `S=1, R=1` is invalid; holds when `S=R=0` |
| **SR Flip-Flop** | Edge-triggered | Clocked SR; requires `output reg`; `sr_ff.v` holds `q`/`qbar` on `S=R=1` |
| **D Flip-Flop** | Edge-triggered | `Q(t+1) = D`; core building block for registers |
| **T Flip-Flop** | Edge-triggered | Toggles when `T=1`; needs reset or init to avoid `X` |
| **JK Flip-Flop** | Edge-triggered | Eliminates invalid state; toggles when `J=1, K=1` |

### Registers and shift registers

A register groups multiple flip-flops under a shared clock to store multi-bit words (`reg [3:0] Q`).

- **Load and clear priority (`reg_4bit.v`, `reg_4bit_str.v`, `reg_4bit_clear.v`):** `reg_4bit_str.v` pairs each D flip-flop with a 2-to-1 MUX so `load=0` feeds back `Q` (hold) and `load=1` loads `D`. `reg_4bit_clear.v` adds a synchronous `clear` checked before `load` in an `if-else` chain, giving `clear` priority over `load`.
- **I/O modes:** Registers are categorized by how data enters and exits: **SISO** (Serial-In, Serial-Out), **SIPO** (Serial-In, Parallel-Out), **PISO** (Parallel-In, Serial-Out), and **PIPO** (Parallel-In, Parallel-Out).
- **4-bit SIPO shift register (`sipo_4bit.v`):** Shifts 1 bit of serial input (`Din`) per active clock edge; a full 4-bit parallel word (`Q[3:0]`) is available after four clock cycles. Because this implementation omits a reset, initial simulation bits appear as `X` until shifted out.
- **4-bit bidirectional PIPO shift register (`reg_pipo.v`):** Uses a 4-to-1 MUX (`mux_4x1_pipo`) per `d_ff_clr` flip-flop controlled by `CTRL[1:0]`:

| `CTRL[1:0]` | Operation | Next State Source |
| :--- | :--- | :--- |
| `00` | Hold | Current `Q` |
| `01` | Left Shift | Serial input `XL` and neighbor bits |
| `10` | Right Shift | Serial input `XR` and neighbor bits |
| `11` | Parallel Load | Parallel input `D[3:0]` |

### Counters and patterns

- **Asynchronous (ripple) counter (`counter_4_async.v`):** Each flip-flop's output clocks the next stage (typically using `J=1, K=1` toggle flip-flops). While simple to wire, accumulated propagation delay slows counting and can cause transient glitches. `counter_4_async.v` triggers on `negedge` of each preceding stage and initializes to zero in simulation, so it counts upward (`0` to `15`). Using `initial` for startup values works in simulation, but an explicit reset is needed for portable hardware.
- **Synchronous counter:** All flip-flops share a single clock edge, providing uniform timing and fewer glitches at the cost of more complex next-state logic. Up/down direction is controlled via a `dir` signal (`dir == 0` counts up, `dir == 1` counts down). No standalone synchronous up/down counter module is currently included in this folder.
- **Pattern counters (Ring and Johnson):**
  - A **4-bit ring counter** circulates a single `1` bit through four states (`1000 -> 0100 -> 0010 -> 0001`). This concept is documented here; no separate ring-counter file is currently in the folder.
  - A **4-bit Johnson counter (`count_4_johnson.v`)** feeds the inverted last bit back into the shift chain (`temp = {~temp[0], temp[3:1]}`) with an asynchronous reset, cycling through eight states:
    `0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000`.

### Figures

#### Figure 35: SR latch RTL schematic
*Elaborated schematic of `sr_latch.v` showing the cross-coupled `RTL_OR` and `RTL_INV` feedback loop.*

[06_Sequential_Logic_Basics/images/01_sr_latch_sch.png]

#### Figure 36: SR latch simulation waveform
*Simulation waveform demonstrating asynchronous set, reset, and hold behavior following an initial `X` state.*

[06_Sequential_Logic_Basics/images/01_sr_latch_waveform.png]

#### Figure 37: SR flip-flop RTL schematic
*Elaborated schematic of `sr_ff.v` showing `RTL_REG_SYNC` storage elements gated by `S` and `R` combinational logic.*

[06_Sequential_Logic_Basics/images/02_sr_ff_sch.png]

#### Figure 38: SR flip-flop simulation waveform
*Simulation waveform confirming clocked set, reset, and hold updates at `posedge clk`.*

[06_Sequential_Logic_Basics/images/02_sr_ff_waveform.png]

#### Figure 39: D flip-flop RTL schematic
*Elaborated schematic of `d_ff.v` mapping `Q <= D` into a single `RTL_REG` storage element.*

[06_Sequential_Logic_Basics/images/03_d_ff_sch.png]

#### Figure 40: D flip-flop simulation waveform
*Simulation waveform confirming `Q` samples `D` at each rising clock edge and holds between edges.*

[06_Sequential_Logic_Basics/images/03_d_ff_waveform.png]

#### Figure 41: T flip-flop RTL schematic
*Elaborated schematic of `t_ff.v` showing `RTL_INV` feedback and `T` driving the register clock-enable (`CE`).*

[06_Sequential_Logic_Basics/images/04_t_ff_sch.png]

#### Figure 42: T flip-flop simulation waveform
*Simulation waveform verifying state hold when `T = 0` and toggling when `T = 1` from an initialized `Q = 0`.*

[06_Sequential_Logic_Basics/images/04_t_ff_waveform.png]

#### Figure 43: JK flip-flop RTL schematic
*Elaborated schematic of `jk_ff.v` showing `RTL_MUX` next-state selection feeding an `RTL_REG`.*

[06_Sequential_Logic_Basics/images/05_jk_ff_sch.png]

#### Figure 44: JK flip-flop simulation waveform
*Simulation waveform verifying hold (`00`), reset (`01`), set (`10`), and toggle (`11`) behavior at clock edges.*

[06_Sequential_Logic_Basics/images/05_jk_ff_waveform.png]

#### Figure 45: 4-bit register RTL schematic
*Elaborated schematic of `reg_4bit.v` capturing a 4-bit bus `D[3:0]` onto `Q[3:0]` on `clk`.*

[06_Sequential_Logic_Basics/images/06_reg_4bit_sch.png]

#### Figure 46: 4-bit register simulation waveform
*Simulation waveform showing parallel 4-bit updates from `D[3:0]` to `Q[3:0]` at each active clock edge.*

[06_Sequential_Logic_Basics/images/06_reg_4bit_waveform.png]

#### Figure 47: Structural 4-bit loadable register RTL schematic
*Structural schematic of `reg_4bit_str.v` pairing four `MUX_2x1_gate` instances with four `DFF` instances.*

[06_Sequential_Logic_Basics/images/07_reg_4bit_str_sch.png]

#### Figure 48: Structural 4-bit loadable register simulation waveform
*Simulation waveform verifying state hold when `load = 0` and parallel data capture when `load = 1`.*

[06_Sequential_Logic_Basics/images/07_reg_4bit_str_waveform.png]

#### Figure 49: 4-bit register with synchronous clear RTL schematic
*Elaborated schematic of `reg_4bit_clear.v` showing `clear` priority ahead of `load` and hold feedback.*

[06_Sequential_Logic_Basics/images/08_reg_4bit_clear_sch.png]

#### Figure 50: 4-bit register with synchronous clear simulation waveform
*Simulation waveform confirming `clear = 1` resets `Q[3:0]` to `0` on `posedge clk` regardless of `load`.*

[06_Sequential_Logic_Basics/images/08_reg_4bit_clear_waveform.png]

#### Figure 51: D flip-flop with synchronous clear RTL schematic
*Elaborated schematic of `d_ff_clr.v`, the single-bit building block with synchronous clear used in `reg_pipo.v`.*

[06_Sequential_Logic_Basics/images/09_d_ff_clr_sch.png]

#### Figure 52: 4-to-1 MUX building block for PIPO shift register RTL schematic
*Elaborated schematic of `mux_4x1_pipo` selecting among hold (`00`), left shift (`01`), right shift (`10`), and parallel load (`11`).*

[06_Sequential_Logic_Basics/images/10_mux_4x1_pipo_sch.png]

#### Figure 53: 4-bit bidirectional PIPO shift register RTL schematic
*Structural schematic of `reg_pipo.v` wiring four `mux_4x1_pipo` instances into four `d_ff_clr` flip-flops.*

[06_Sequential_Logic_Basics/images/11_reg_pipo_sch.png]

#### Figure 54: 4-bit bidirectional PIPO shift register simulation waveform
*Simulation waveform exercising parallel load (`11`), left shift (`01`), right shift (`10`), and hold (`00`).*

[06_Sequential_Logic_Basics/images/11_reg_pipo_waveform.png]

#### Figure 55: 4-bit SIPO shift register RTL schematic
*Elaborated schematic of `sipo_4bit.v` chaining four flip-flops serially with parallel taps `Q[3:0]`.*

[06_Sequential_Logic_Basics/images/12_sipo_4bit_sch.png]

#### Figure 56: 4-bit SIPO shift register simulation waveform
*Simulation waveform showing `Din` shifting across four clock edges (`XXX1` -> `XX11` -> `X111` -> `1111`) until `Q[3:0]` is full.*

[06_Sequential_Logic_Basics/images/12_sipo_4bit_waveform.png]

#### Figure 57: 4-bit asynchronous (ripple) counter RTL schematic
*Elaborated schematic of `counter_4_async.v` where each stage's output ripples into the next stage's clock.*

[06_Sequential_Logic_Basics/images/13_counter_4_async_sch.png]

#### Figure 58: 4-bit asynchronous (ripple) counter simulation waveform
*Simulation waveform of `counter_4_async.v` counting upward (`0` to `15`) using falling-edge (`negedge`) ripple triggers across all four stages.*

[06_Sequential_Logic_Basics/images/13_counter_4_async_waveform.png]

#### Figure 59: 4-bit Johnson counter RTL schematic
*Elaborated schematic of `count_4_johnson.v` with inverted LSB feedback (`~temp[0]`) and asynchronous `reset`.*

[06_Sequential_Logic_Basics/images/14_count_4_johnson_sch.png]

#### Figure 60: 4-bit Johnson counter simulation waveform
*Simulation waveform cycling through the eight-state twisted-ring sequence (`0 -> 8 -> c -> e -> f -> 7 -> 3 -> 1 -> 0`).*

[06_Sequential_Logic_Basics/images/14_count_4_johnson_waveform.png]

---

## 7. Verilog debugging and synthesizable RTL — `07_Verilog_Debugging/`

Effective debugging starts with reproducing the issue and identifying its stage: syntax error, compilation/elaboration error, runtime/simulation mismatch, or synthesis warning.

### Effective debugging practices

- **Isolate the context:** Record the exact error message, tool and version (Vivado or ModelSim), affected module and port names, vector widths, and clock/reset conditions.
- **Trace `X` values:** Unknown states in waveforms usually indicate uninitialized registers, missing reset assertions, multi-driver conflicts, or incomplete testbench stimulus.
- **Write actionable problem reports:** Provide the exact diagnostic text, tool name, and the minimal module plus testbench code rather than vague descriptions like *"my code is not working."*

### Synthesizable RTL guidelines

Synthesizable RTL describes logic that synthesis tools (such as Vivado or Quartus) can map onto physical gates, multiplexers, and flip-flops:

- Use **nonblocking assignments (`<=`)** for sequential state updates and **blocking assignments (`=`)** for combinational calculations.
- Assign all outputs on every path in combinational `always @*` blocks to avoid unintended latch inference.
- Keep sensitivity lists complete (`always @*` in Verilog or `always_comb` in SystemVerilog).
- Describe reset behavior explicitly and consistently (synchronous or asynchronous, active-high or active-low).
- Keep simulation-only constructs—such as `#` delays, `forever` loops, `wait` statements, file I/O, and `real` data types—out of RTL modules and inside testbenches.
- Avoid `initial` blocks in portable ASIC RTL (FPGA tools may support them for certain resources, depending on device and flow).
- Inspect **synthesis warnings** as well as errors; warnings frequently reveal inferred latches, undriven nets, width mismatches, or trimmed logic.

### Synthesizability checklist

1. Remove `#` delays and simulation-only tasks from synthesizable RTL files.
2. Confirm combinational blocks assign every output on all paths and sequential blocks trigger on the intended clock edge.
3. Verify reset polarity, synchronous/asynchronous behavior, and priority relative to control signals like `load`.
4. Check port directions and vector widths across all module instantiations.
5. Run synthesis in Vivado or Quartus and review all warnings alongside errors.

Note: `07_Verilog_Debugging/` currently contains documentation rather than standalone design or testbench files.

---

---

## 8. Finite state machines — `08_Finite_State_Machines/`

A Finite State Machine (FSM) describes the sequence of steps taken by a digital system[cite: 111]. The system transitions between a finite number of conditions (states) based on incoming inputs and predefined sequences[cite: 111]. 

FSMs are categorized into two primary types based on how outputs are generated:
- **Moore Machine:** The output depends strictly on the current state[cite: 112].
- **Mealy Machine:** The output depends on both the current state and the current input values[cite: 112].

To ensure synthesizability and avoid simulation hazards, all FSMs in this repository are modeled using the standard 3-block architecture:
1. **State Register:** A sequential `always @(posedge clk)` block that updates `state <= next_state`.
2. **Next-State Logic:** A combinational `always @*` block using a complete `case` statement to determine transitions.
3. **Output Logic:** A combinational `always @*` block driving outputs based on `state` (Moore) or `state` and inputs (Mealy).

### FSM Counters
Counters can be modeled explicitly as state machines rather than simple arithmetic adders.
- **Enabled Counter (`fsm_counter.v`):** Cycles through states `S0` to `S3` only when the `din` (enable) signal is asserted.
- **Up/Down Counter (`fsm_up_down_count.v`):** A 4-state machine where `dir = 0` triggers upward counting transitions and `dir = 1` triggers downward counting transitions[cite: 123].

### Pattern Detectors
A pattern detector monitors a running serial bitstream to recognize a specific sequence (e.g., `1011`)[cite: 120].
- **Moore Implementation (`fsm_pattern_moore.v`):** Requires 5 distinct states (`Sin`, `S1`, `S10`, `S101`, `S1011`) to detect the 4-bit `1011` sequence because the output must be mapped to a dedicated final state[cite: 126]. 
- **Mealy Implementation (`fsm_pattern_mealy.v`):** Requires only 4 states (`Sin`, `S1`, `S10`, `S101`)[cite: 126]. The output is asserted dynamically during the transition from the final state when the correct input arrives, reducing the required hardware footprint.

### Figures

#### Figure 61: FSM counter RTL schematic
*Elaborated schematic of `fsm_counter.v` showing the state register and combinational next-state routing.*

![Figure 61: FSM counter RTL schematic](08_Finite_State_Machines/images/01_fsm_counter_sch.png)

#### Figure 62: FSM counter simulation waveform
*Simulation waveform showing state transitions pausing when `din = 0` and resuming when `din = 1`.*

![Figure 62: FSM counter simulation waveform](08_Finite_State_Machines/images/01_fsm_counter_waveform.png)

#### Figure 63: Up/Down counter FSM RTL schematic
*Elaborated schematic of `fsm_up_down_count.v` driven by the `dir` control signal.*

![Figure 63: Up/Down counter FSM RTL schematic](08_Finite_State_Machines/images/02_fsm_up_down_count_sch.png)

#### Figure 64: Up/Down counter FSM simulation waveform
*Simulation waveform verifying directional changes when `dir` toggles between `0` and `1`.*

![Figure 64: Up/Down counter FSM simulation waveform](08_Finite_State_Machines/images/02_fsm_up_down_count_waveform.png)

#### Figure 65: Moore pattern detector RTL schematic
*Elaborated schematic of `fsm_pattern_moore.v` demonstrating the 5-state logic architecture.*

![Figure 65: Moore pattern detector RTL schematic](08_Finite_State_Machines/images/03_fsm_pattern_moore_sch.png)

#### Figure 66: Moore pattern detector simulation waveform
*Simulation waveform showing `Z` asserting high exclusively when the state reaches `S1011`.*

![Figure 66: Moore pattern detector simulation waveform](08_Finite_State_Machines/images/03_fsm_pattern_moore_waveform.png)

#### Figure 67: Mealy pattern detector RTL schematic
*Elaborated schematic of `fsm_pattern_mealy.v` demonstrating the reduced 4-state logic architecture.*

![Figure 67: Mealy pattern detector RTL schematic](08_Finite_State_Machines/images/04_fsm_pattern_mealy_sch.png)

#### Figure 68: Mealy pattern detector simulation waveform
*Simulation waveform showing `Z` asserting immediately based on current input and state combination.*

![Figure 68: Mealy pattern detector simulation waveform](08_Finite_State_Machines/images/04_fsm_pattern_mealy_waveform.png)

## Scope and next work

This repository now spans combinational arithmetic, multiplexing, decoding, code conversion, and comparison alongside sequential storage elements, shift registers, counters, and synthesizable RTL practices. Natural next steps include adding self-checking testbenches with automated pass/fail checks, implementing a synchronous up/down counter module, exploring finite-state machines (FSMs), and running synthesis and timing analysis exercises.