# Module 3: Decoders & Demultiplexers

This module covers data routing and decoding logic, progressing from simple behavioral models to more complex structural hierarchies.

### Circuits implemented
* **1-to-4 demultiplexer:** `demux_1x4.v` (dataflow)
* **2-to-4 decoder:** `dec_2to4.v` (dataflow)
* **2-to-4 decoder (enabled):** `dec_2to4_en.v` (dataflow)
* **3-to-8 decoder:** `dec_3to8.v` (structural instantiation using `dec_2to4_en`)
* **Function implementation:** `func_decoder.v` (using a 3-to-8 decoder to implement a Boolean sum of minterms)

### Verification
All modules include `tb_*.v` testbenches utilizing `$monitor` for automated stimulus generation and truth-table printing.

### Visual artifacts
*(See the `images/` folder for Vivado RTL schematics and simulation waveforms.)*

This module completes the combinational routing and decoding portion of the repository before the sequential logic and register-focused topics in `06_Sequential_Logic_Basics/`.

