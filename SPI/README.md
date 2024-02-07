# SPI (Serial Peripheral Interface) Controller Verilog Module

## Overview
This Verilog module implements a simple Serial Peripheral Interface (SPI) controller (Zedboard). It is designed for FPGA implementation, specifically targeting the Zynq platform. The module allows for the serial transmission of 8-bit data using a provided clock signal (SPI is a synchronous serial communication protocol commonly used for communication between devices in embedded systems).

## Module Details

### Inputs
- `clock`: On-board Zynq clock (100 MHz)
- `reset`: Asynchronous reset signal
- `data_in[7:0]`: Input data to be transmitted
- `load_data`: Signal to indicate new data for transmission

### Outputs
- `done_send`: Signal indicating completion of data transmission
- `spi_clock`: SPI clock signal with a maximum frequency of 10 MHz
- `spi_data`: Output data transmitted serially

## Operation
The module operates as an FSM (Finite State Machine) with three main states: `IDLE`, `SEND`, and `DONE`. The state transitions are controlled by the rising edge of a divided clock (`clock_10`).

1. **IDLE State:**
   - Waits for the `load_data` signal to be asserted.
   - Loads `data_in` into a shift register and transitions to the `SEND` state.

2. **SEND State:**
   - Serially shifts out the bits of the shift register on each falling edge of the clock.
   - Activates the chip enable (`CE`) signal.
   - Transitions to the `DONE` state after sending all 8 bits.

3. **DONE State:**
   - Deactivates the chip enable (`CE`) signal.
   - Sets `done_send` signal to indicate completion.
   - Returns to the `IDLE` state if `load_data` is deasserted.

## Clock Generation
The module generates a 10 MHz clock signal (`spi_clock`) for SPI communication by dividing the input clock signal.

## Reset
The module supports asynchronous reset. When the reset signal is asserted, the state machine and internal variables are reset to their initial values.

## Usage
Instantiate the `spiControl` module in your FPGA design, connecting the appropriate signals based on the provided interface.
