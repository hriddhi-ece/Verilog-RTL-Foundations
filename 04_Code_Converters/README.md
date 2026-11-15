# Module 4: Code Converters

This module explores digital code translation, specifically converting Gray Code to Binary using different Verilog modeling abstractions.

### Circuits Implemented
* **Gray-to-Binary (Behavioral):** `gtob_case.v` (Uses a `case` statement with a `default` fallback to prevent memory latches).
* **Gray-to-Binary (Dataflow):** `gtob_data.v` (Uses continuous assignment and XOR logic).

### Verification
The `tb_gtob.v` testbench iterates through all 16 possible 4-bit combinations using automated stimulus generation to print and verify the output against the standard Gray-to-Binary truth table.

### Visual Artifacts
*(See `images/` folder for Vivado RTL schematics and simulation waveforms)*