# Module 2: Multiplexers

This module focuses on data routing using 2-to-1 and 4-to-1 Multiplexers, demonstrating behavioral, dataflow, and structural modeling.

### Circuits Implemented
* **2-to-1 MUX (Behavioral):** `MUX_2x1.v` (`input I0, I1, S` | `output reg Y`)
* **2-to-1 MUX (Gate):** `MUX_2x1_gate.v` (`input i0, i1, s` | `output y`)
* **2-to-1 MUX (Dataflow):** `MUX2x1_data.v` (`input i0, i1, s` | `output y`)
* **4-to-1 MUX (Structural):** `mux_4x1.v` (Instantiates three `MUX_2x1_gate` modules)

### Verification
Custom `tb_*.v` testbenches are provided for each design, using automated stimulus generation to print exhaustive truth tables directly to the console.

### Visual Artifacts
*(See `images/` folder for Vivado RTL schematics and simulation waveforms)*