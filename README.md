# CLOCK_DOMAIN_CROSSING_ASYNC_FIFO

## Overview
This project implements an **Asynchronous FIFO (First-In First-Out)** in **Verilog HDL** to safely transfer multi-bit data between two independent clock domains. Asynchronous FIFOs are widely used in **Clock Domain Crossing (CDC)** applications to minimize metastability and ensure reliable data transfer between asynchronous interfaces.

The design uses separate write and read clocks, independent reset signals, FIFO memory, pointer logic, and full/empty status flags to prevent data overflow and underflow.


## Design Specifications

- FIFO Type : Asynchronous FIFO
- Data Width : 8 bits
- FIFO Depth : 8 locations
- Write Clock : Independent (`wr_clk`)
- Read Clock : Independent (`rd_clk`)
- Write Reset : `wr_rst`
- Read Reset : `rd_rst`


## Features

- Asynchronous FIFO Architecture
- Separate Write and Read Clock Domains
- Safe Clock Domain Crossing (CDC)
- Independent Write and Read Operations
- Full and Empty Flag Generation
- Prevents FIFO Overflow and Underflow
- Dual Clock FIFO Memory
- Verified using Verilator and GTKWave
- Simulated using Xilinx Vivado



## Why Asynchronous FIFO?

When data is transferred between two modules operating on different clock domains, direct transfer may lead to **metastability** and **data corruption**.

To solve this:

- Single-bit control signals use **2-Flip-Flop Synchronizers**
- Multi-bit data is transferred through an **Asynchronous FIFO**

Asynchronous FIFOs safely buffer data between unrelated clock domains while maintaining data integrity.

---

## Block Diagram
<img width="623" height="398" alt="image" src="https://github.com/user-attachments/assets/0f3dab10-90b0-49df-9182-36635464b3f6" />


## FIFO Architecture

The FIFO consists of the following components:

- FIFO Memory (8 × 8)
- Write Pointer
- Read Pointer
- Write Logic
- Read Logic
- Full Flag Generator
- Empty Flag Generator
- Independent Read and Write Clock Domains

---

## Working Principle

### Write Operation

- Data is written into the FIFO on every positive edge of **wr_clk** when:
  - `wr_en = 1`
  - `wr_full = 0`

### Read Operation

- Data is read from the FIFO on every positive edge of **rd_clk** when:
  - `rd_en = 1`
  - `rd_empty = 0`

### Full Condition

The FIFO asserts **wr_full** when no additional data can be stored.

### Empty Condition

The FIFO asserts **rd_empty** when there is no valid data available to read.

---

## Tools & Languages Used

- Verilog HDL
- Verilator
- GTKWave
- Xilinx Vivado

---



## How to Run in Xilinx Vivado

1. Create a new Vivado project.
2. Add the RTL file `async_fifo.v`.
3. Add the testbench `async_fifo_tb.v`.
4. Run Behavioral Simulation.
5. Observe:
   - Write Clock
   - Read Clock
   - Write Pointer
   - Read Pointer
   - FIFO Memory Operations
   - `wr_full`
   - `rd_empty`
   - `wr_data`
   - `rd_data`

---

## How to Run in Verilator

1. Place `async_fifo.v` and `async_fifo_tb.v` in the project directory.
2. Create a script named `run.sh`.
3. Make the script executable:

chmod +x run.sh


4. Execute the script:

./run.sh


5. Observe all FIFO signals and verify data transfer across different clock domains.


## Simulation Results

### GTK Wave simulation
<img width="1366" height="768" alt="gtkwave_simulation" src="https://github.com/user-attachments/assets/4aae02ab-1f2c-47c5-ab46-b50f9b8104d0" />

### Vivado simulation

<img width="1366" height="768" alt="vivado_simulation" src="https://github.com/user-attachments/assets/04de8675-a8cd-417b-98c9-be046044d1ac" />


## Applications

- Clock Domain Crossing (CDC)
- SoC Interconnects
- Network-on-Chip (NoC)
- UART, SPI, I2C Interfaces
- High-Speed Communication Systems
- FPGA Designs
- ASIC Designs


## Key Learnings

- Clock Domain Crossing (CDC)
- Asynchronous FIFO Design
- Multi-Clock Digital Design
- FIFO Memory Management
- Full and Empty Flag Logic
- Metastability Reduction Techniques
- Verilog RTL Design
- Functional Verification using Verilator and Vivado
