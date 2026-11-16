# Module 2: Multiplexers

This module focuses on data routing using 2-to-1 and 4-to-1 multiplexers, demonstrating behavioral, dataflow, and structural modeling.

### Circuits implemented
* **2-to-1 MUX (behavioral):** `MUX_2x1.v` (`input I0, I1, S` | `output reg Y`)
* **2-to-1 MUX (gate):** `MUX_2x1_gate.v` (`input i0, i1, s` | `output y`)
* **2-to-1 MUX (dataflow):** `MUX2x1_data.v` (`input i0, i1, s` | `output y`)
* **4-to-1 MUX (structural):** `mux_4x1.v` (instantiates three `MUX_2x1_gate` modules)

### Verification
Custom `tb_*.v` testbenches are provided for each design, using automated stimulus generation to print exhaustive truth tables directly to the console.

### Visual artifacts
*(See the `images/` folder for Vivado RTL schematics and simulation waveforms.)*

This module is part of the repository’s core combinational logic sequence and leads naturally into the sequential logic examples in `06_Sequential_Logic_Basics/`.

