# Sequential Logic: Flip-Flops, Registers & Counters

This module introduces clocked state and the memory elements used to build registers and counters. The examples progress from latches and flip-flops to shift registers and counters.

### 1. Latches and flip-flops

- **Sequential logic:** Unlike combinational logic, sequential circuits retain state and use previous values when determining future outputs.
- **Triggering:** Latches are level-sensitive; flip-flops are edge-triggered and update on a rising or falling clock edge.
- **SR latch:** `sr_latch.v` demonstrates a level-sensitive set/reset latch. `S=1, R=0` sets `Q`; `S=0, R=1` resets it; `S=R=0` holds it. `S=R=1` is the invalid condition for the usual NOR implementation.
- **SR flip-flop:** `sr_ff.v` demonstrates a clocked SR element.
- **D flip-flop:** `d_ff.v` captures `D` on the active clock edge. `d_ff_clr.v` adds a synchronous clear. In Verilog, a procedurally assigned output is declared `reg` (or `logic` in SystemVerilog).
- **T flip-flop:** `t_ff.v` holds its state when `T=0` and toggles when `T=1`. Without reset or initialization, simulation may begin with an unknown (`X`) value.
- **JK flip-flop:** `jk_ff.v` behaves like an SR flip-flop but the `J=K=1` case toggles rather than being invalid.

### 2. Registers and shift registers

- **4-bit register:** `reg_4bit.v` stores a four-bit value. `reg_4bit_str.v` builds a loadable register from D flip-flops and 2-to-1 multiplexers; when `load=0` it feeds the current value back, and when `load=1` it loads `D`.
- **Register with clear and load:** `reg_4bit_clear.v` gives clear priority over load. Its clear is synchronous because it is tested inside `always @(posedge clk)`.
- **I/O modes:** SISO means serial-in/serial-out, SIPO serial-in/parallel-out, PISO parallel-in/serial-out, and PIPO parallel-in/parallel-out.
- **SIPO:** `sipo_4bit.v` shifts serial input into a four-bit register when `load` is asserted. Four clock edges are needed to shift in four serial bits. This implementation has no reset, so its initial state is undefined until the first valid input arrives.
- **Bidirectional PIPO/universal shift register:** `reg_pipo.v` uses `mux_4x1_pipo.v` to select the next input for each flip-flop. The control mapping is `00` hold, `01` shift left, `10` shift right, and `11` parallel load.

### 3. Counters

- **Asynchronous (ripple) counter:** `counter_4_async.v` clocks each stage from the preceding bit, so transitions ripple through the counter. This can accumulate propagation delay and produce timing issues in larger counters.
- **Synchronous counter:** All flip-flops share one clock. A synchronous up/down counter uses direction logic to select increment or decrement at each edge; no synchronous up/down counter is currently provided in this folder.
- **Ring counter:** A one-hot bit circulates through the register. A four-bit ring counter has four states when correctly initialized; this is a concept, not a separate source file in this folder.
- **Johnson counter:** `count_4_johnson.v` feeds the inverted last bit back into a four-bit shift chain. With reset, it cycles through eight states: `0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000`.

### Verification
The matching `tb_*.v` files apply stimulus and use `$monitor` for visual inspection of signal changes. A printed trace or waveform is not an automated pass/fail check unless the testbench includes assertions.

### Visual artifacts
See `images/` for the available RTL schematics and simulation waveforms for the latch, flip-flops, registers, shift registers, ripple counter, and Johnson counter.

### How to simulate (Vivado)
1. Add the design `.v` file and its matching `tb_*.v` testbench to the project.
2. For structural designs, also add every instantiated submodule (for example, `d_ff.v`, `d_ff_clr.v`, `mux_4x1_pipo.v`, and the required 2-to-1 mux module).
3. Set the testbench as the simulation top.
4. Select **Run Simulation** → **Run Behavioral Simulation**.

