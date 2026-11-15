# Module 3: Decoders & Demultiplexers

This module covers data routing and decoding logic, progressing from simple behavioral models to complex structural hierarchies.

### Circuits Implemented
* **1-to-4 Demultiplexer:** `demux_1x4.v` (Dataflow)
* **2-to-4 Decoder:** `dec_2to4.v` (Dataflow)
* **2-to-4 Decoder (Enabled):** `dec_2to4_en.v` (Dataflow)
* **3-to-8 Decoder:** `dec_3to8.v` (Structural instantiation using `dec_2to4_en`)
* **Function Implementation:** `func_decoder.v` (Using a 3-to-8 decoder to implement a Boolean sum of minterms)

### Verification
All modules include `tb_*.v` testbenches utilizing `$monitor` for automated stimulus generation and truth table printing.

### Visual Artifacts
*(See `images/` folder for Vivado RTL schematics and simulation waveforms)*