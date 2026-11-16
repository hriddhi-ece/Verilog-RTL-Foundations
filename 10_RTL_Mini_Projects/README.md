# RTL Mini-Projects

This module brings together combinational logic, 7-segment display interfacing, and multi-state Finite State Machines (FSMs) in three practical Verilog mini-projects, bridging simulation-level verification and FPGA hardware deployment.

## Projects and Files

### 1. Car Parking Management System
Tracks occupied spots across an 8-slot parking lot and displays the total parked car count.
- **`Car_parking.v`**: Combinational counter (`input [7:0] Cars`, `output reg [3:0] num`) that sums active slot sensors (`0`–`8`) for behavioral simulation.
- **`Car_parking_7_seg.v`**: Hardware-ready version that maps the 4-bit count onto a common-anode 7-segment display (`seg[6:0]`, `AN[7:0]`).
- **`Car_parking_Nexys.xdc`**: Xilinx Design Constraints file targeting the **Digilent Nexys 4 DDR** board, mapping `Cars[7:0]` to slide switches `SW[7:0]` and driving the rightmost 7-segment digit (`AN = 8'b11111110`).

### 2. Vending Machine Controller
Models an automated single-product vending machine (product price: 40 units) using an FSM.
- **`Vending_machine.v`**: 9-state FSM (`Sin`, `S10`–`S80`) accepting 2-bit encoded currency inputs (`ten = 2'b00`, `twenty = 2'b01`, `fifty = 2'b10`). Asserts `Z` when the total reaches or exceeds 40, asserts `change_given` for states `S50`–`S80`, and resets back to `Sin` on the next clock edge.

### 3. 4-Way Traffic Light Controller
Coordinates a four-direction intersection (`north`, `west`, `south`, `east`) so only one direction moves at a time.
- **`Traffic_sys.v`**: 8-state FSM (`north`, `north_yellow`, `west`, `west_yellow`, `south`, `south_yellow`, `east`, `east_yellow`) with an internal 4-bit cycle counter (`count`). Holds each green phase (`3'b001`) for 16 clock cycles and each yellow phase (`3'b010`) for 4 clock cycles while keeping all other directions red (`3'b100`).

## Verification and Output Checklist

When adding project outputs to `images/`, capture and verify the following:
1. **Car Parking:** Behavioral simulation waveform (`Car_parking.v`) with random sensor combinations, plus synthesis/implementation schematic (`Car_parking_7_seg.v` with `Car_parking_Nexys.xdc`).
2. **Vending Machine:** Behavioral simulation waveform (`Vending_machine.v`) verifying exact-change (`S40`), overpay-with-change (`S50`–`S80`), and `reset` transitions with inputs driven cleanly before `posedge clk`.
3. **Traffic Controller:** Behavioral simulation waveform (`Traffic_sys.v`) running across multiple full 4-way rotations and testing asynchronous `reset` mid-cycle.