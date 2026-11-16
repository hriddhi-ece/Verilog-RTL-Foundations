# Finite State Machines (FSMs)

This module explores sequential control logic by implementing finite state machines. All designs use a strictly synthesizable 3-block FSM architecture: state register, next-state logic, and output logic.

### 1. FSM counters
- **Enabled counter (`fsm_counter.v`):** A Moore machine that counts `0 -> 1 -> 2 -> 3 -> 0` while the `din` (enable) signal is high.
- **Up/down counter (`fsm_up_down_count.v`):** A Moore machine that increments when `dir = 0` and decrements when `dir = 1`.

### 2. Pattern detectors (sequence: 1011)
- **Moore machine (`fsm_pattern_moore.v`):** Uses 5 states. The output `Z` depends strictly on the current state.
- **Mealy machine (`fsm_pattern_mealy.v`):** Uses only 4 states. The output `Z` is calculated during the transition from the final state based on the current state and current input.

### Verification
Custom `tb_*.v` testbenches apply specific input streams (including overlapping sequences) to display state transitions and outputs directly to the console via `$monitor`.

### How to simulate (Vivado)
1. Add the desired design `.v` file and its matching `tb_*.v` testbench to your Vivado project.
2. Right-click the testbench in the Hierarchy window and select **Set as Top**.
3. Click **Run Simulation** -> **Run Behavioral Simulation**.

