# Module 5: Comparators

This module introduces magnitude comparison logic, scaling from single-bit evaluation to multi-bit structural comparison.

### Circuits implemented
* **1-bit magnitude comparator:** `comp_1bit.v` (evaluates greater, equal, and smaller conditions using bitwise logic and XNOR).
* **2-bit magnitude comparator:** `comp_2bit.v` (structurally instantiates two `comp_1bit` modules for MSB and LSB, combining their outputs via gate-level `and` and `or` primitives).
* **4-bit magnitude comparator:** `comp_4bit.v` (extends the structural gate-level approach by cascading four `comp_1bit` instances from MSB to LSB using `and` and `or` primitives).

### Verification
Verified via simulation testbenches using automated stimulus generation and `$monitor` print inspection to confirm all comparison states.

### Visual artifacts
*(See the `images/` folder for Vivado RTL schematics and simulation waveforms.)*

This module concludes the combinational logic portion of the repository and is followed by the sequential case studies in `06_Sequential_Logic_Basics/` and the practical RTL guidance in `07_Verilog_Debugging/`.