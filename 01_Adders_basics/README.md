# Combinational Arithmetic (Adders)

This folder contains basic digital arithmetic circuits (Half Adders and Full Adders) implemented across multiple Verilog modeling abstractions:
* **Gate-Level:** Explicit primitive wiring (`HA_gate.v`, `fa_gate.v`)
* **Dataflow:** Continuous assignments and concatenation (`FA_data.v`, `half_adder_data.v`)
* **Structural:** Hierarchical module instantiation (`FA_using_HA.v`)
* **Behavioral:** Procedural logic using `case` and `if-else` (`HA_case.v`, `fa_case.v`, `fa_if.v`)

Every design file is paired with an automated testbench (`tb_*.v`) for exhaustive truth table verification.