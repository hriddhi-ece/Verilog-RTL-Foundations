# VLSI Learning Log & Methodology

This log documents my progression through my VLSI coursework. It serves as an engineering reference for hardware concepts, verification setups, personal coding rules, and Vivado synthesis artifacts.

*Note: All practical assignments (e.g., ALU design, pattern detectors) are being batched and will be executed and documented simultaneously upon completion of the theoretical coursework.*

---

## Module 02 (Part B): Core HDL Concepts (Data Types, Operators & Loops)

### Hardware Data Types
* **`wire` (Nets):** Represents physical connections between structural entities. Must be driven continuously (e.g., via `assign` or module instantiation outputs). They do not store values[cite: 29].
* **`reg` (Registers):** Storage elements used to hold values across time. Must be used when a signal is driven from within a procedural block (`initial` or `always`). Despite the name, a `reg` does not always synthesize into a physical hardware register (flip-flop); it can infer combinational logic if not clocked[cite: 30].

### Verilog Operators & Hardware Impact
* **Concatenation `{}`:** Used to combine scalar or vector nets into a larger bus. (e.g., `assign {Cout, Sum} = A + B + Cin;` maps the arithmetic carry to the MSB and sum to the LSB)[cite: 13].
* **Logical vs. Bitwise:** Bitwise operators (`&`, `|`, `^`) generate parallel hardware gates for each bit in a bus[cite: 98]. Logical operators (`&&`, `||`, `!`) evaluate to a single scalar boolean true/false (1/0), typically used for conditional routing[cite: 98].

### Procedural Loops in Hardware
Unlike software, Verilog loops are evaluated by a synthesizer to generate physical hardware architecture.
* **Synthesizable Loops:** 
  * `for`: The compiler evaluates the start/stop conditions and unrolls the loop, stamping out duplicate parallel hardware for each iteration[cite: 96, 98].
  * `repeat`: Executes assignments a fixed, predetermined number of times, which can also be unrolled into hardware[cite: 94].
* **Non-Synthesizable Loops (Verification Only):**
  * `forever`: Executes infinitely. Used strictly in testbenches (e.g., generating a continuous clock stimulus)[cite: 93].
  * `while`: Executes based on dynamic condition checks. Cannot be accurately mapped to static gate-level hardware and is restricted to simulation/testbenches[cite: 95].

---

## Module 02 (Part A): Multiplexer Architectures (`02_Multiplexers/`)

### Design Progression
* **Behavioral Modeling:** 2-to-1 Multiplexer (`MUX_2x1.v`) designed utilizing procedural `always` blocks and `if-else` conditional routing.

### Verification Methodology
Select-line verification was executed using the cascaded clock methodology. I assigned the select line (S) the highest frequency (100ns period) to visually validate the dynamic routing of the slower data channels (I0 at 400ns, I1 at 200ns) to the output net.

*(2x1 MUX RTL Schematic & Simulation Waveform)*
![2x1 MUX Schematic](02_Multiplexers/images/MUX_2x1_SCHEMATIC.png)
![2x1 MUX Waveform](02_Multiplexers/images/MUX_2x1_SIM.png)

---

## Module 01: Combinational Arithmetic (`01_Adders_basics/`)

### Design Progression
1. **Gate-Level:** Half Adder (`HA_gate.v`) wired using explicit `xor` and `and` primitives.
2. **Dataflow:** Half Adder built using arithmetic concatenation (`half_adder_data.v`) and bitwise operators (`half_adder_data1.v`). Full Adder (`FA_data.v`) built via continuous `assign` statements.
3. **Structural:** Full Adder (`FA_using_HA.v`) constructed by instantiating sub-modules (`HA_gate.v`) and mapping the internal nets.
4. **Behavioral:** Half Adder (`HA_case.v`) implemented via procedural `case` statements to observe LUT/Multiplexer hardware inference.

### Verification Methodology: GUI Force Clocks
Instead of writing manual Verilog testbenches, I utilized Vivado's `Force Clock` continuous stimulus. By assigning cascading clock periods (400ns, 200ns, 100ns) to the input ports within the GUI, the simulator automatically cycles through all potential binary states.

*(Manual Force Clock Configuration & Truth Table Reference)*
![Force Clock Settings](01_Adders_basics/images/FA_force_clocks.png)
![Truth Table](01_Adders_basics/images/FA_truth_table.png)

*(Full Adder: Synthesized RTL Schematic & Validated Waveform)*
![Full Adder Schematic](01_Adders_basics/images/FA_schematic.png)
![Full Adder Waveform](01_Adders_basics/images/FA_truthtable_waveform.png)

*(Half Adder via Case Statement: Synthesized LUT/MUX Schematic & Waveform)*
![Half Adder Case Schematic](01_Adders_basics/images/HA_case_schematic.png)
![Half Adder Case Waveform](01_Adders_basics/images/HA_case_sim.png)

---

## Personal Coding Guidelines & Rules
* **Assignment Rules:** Strictly use Blocking Assignments (`=`) for combinational logic and Non-Blocking Assignments (`<=`) for sequential logic inside clocked `always` blocks.
* **Procedural Constructs:** Conditional statements (`if-else`, `case`, `for` loops) cannot stand alone; they must be encapsulated within an `always` or `initial` procedural block.
* **Hardware Datatypes:** Any signal driven from within an `always` block must be declared as a `reg` data type, while continuous assignments outside procedural blocks must drive `wire` nets.