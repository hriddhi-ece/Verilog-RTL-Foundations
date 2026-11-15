# Module 4: Code Converters

This module explores digital code translation, specifically converting Gray code to binary using different Verilog modeling abstractions.

### Circuits implemented

- **Gray-to-binary (behavioral):** `gtob_case.v` uses a `case` statement with assignments for every input pattern.
- **Gray-to-binary (dataflow):** `gtob_data.v` uses continuous assignments and XOR logic.

### Verification

The `tb_gtob.v` testbench iterates through all 16 possible 4-bit combinations using automated stimulus generation to display the output against the standard Gray-to-binary truth table. It prints results with `$monitor`; it does not automatically compare them against expected values.

### Visual artifacts

See the `images/` folder for Vivado RTL schematics and simulation waveforms.
