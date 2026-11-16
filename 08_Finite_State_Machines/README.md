# Finite State Machines (FSMs)

This module explores sequential control logic by implementing Finite State Machines. All designs utilize a strictly synthesizable 3-block FSM architecture (State Register, Next-State Logic, and Output Logic) to prevent latch inference and timing hazards.

### 1. FSM Counters
- **Enabled Counter (`fsm_counter.v`):** A Moore machine that counts `0 -> 1 -> 2 -> 3 -> 0` while the `din` (enable) signal is high.
- **Up/Down Counter (`fsm_up_down_count.v`):** A Moore machine that increments when `dir = 0` and decrements when `dir = 1`.

### 2. Pattern Detectors (Sequence: 1011)
- **Moore Machine (`fsm_pattern_moore.v`):** Uses 5 states. The output `Z` depends strictly on the current state.
- **Mealy Machine (`fsm_pattern_mealy.v`):** Uses only 4 states. The output `Z` is calculated asynchronously during the transition from the final state based on the current state and current input.

### Verification
Custom `tb_*.v` testbenches apply specific input streams (including overlapping sequences) to display state transitions and outputs directly to the console via `$monitor`. 

### How to Simulate (Vivado)
1. Add the desired design `.v` file and its matching `tb_*.v` testbench to your Vivado project.
2. Right-click the testbench in the Hierarchy window and select **Set as Top**.
3. Click **Run Simulation** -> **Run Behavioral Simulation**.