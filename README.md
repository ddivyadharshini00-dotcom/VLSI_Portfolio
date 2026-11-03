# 8-Bit Parameterized Arithmetic Logic Unit (ALU)

Welcome to my digital logic design portfolio! This repository highlights a fully functional, combinational 8-bit Arithmetic Logic Unit (ALU) designed using behavioral Verilog RTL and verified through automated simulation.

## 🛠️ Project Toolchain
* **Hardware Description Language:** Verilog RTL
* **Simulation Platform:** EDA Playground (Browser-based cloud environment)
* **Simulation Engine:** Icarus Verilog 12.0
* **Waveform Visualization:** EPWave Timing Viewer

## 🎛️ Architecture & Feature Set
Guided by a 3-bit operational selector (`ALU_Sel`), this module handles native 8-bit arithmetic execution, bitwise logic operations, and data-shifting operations with hardware flag monitoring:

* **Arithmetic Functions:** Addition (`A + B`) and Subtraction (`A - B`).
* **Bitwise Logic Functions:** AND, OR, XOR, and NOT operations.
* **Shifting Architectures:** Logical Left Shift (`<< 1`) and Logical Right Shift (`>> 1`).
* **Hardware Status Monitoring:** Dynamic updates for **Zero (Z)**, **Carry-Out (C)**, and signed Two's Complement **Overflow (V)**.

## 🔬 Functional Verification & Edge Cases Tested
The automated testbench (`alu_tb.v`) subjected the module to the following layout stress tests to verify corner-case hardware compliance:
1. **Unsigned Roll-over Condition (255 + 1):** Verified output resets to `0` and triggers the `CarryOut` flag cleanly.
2. **Two's Complement Underflow (0 - 1):** Proved borrow conditions function as intended in modular binary architectures.
3. **Signed Positive Overflow (127 + 1):** Demonstrated that adding two positive inputs resulting in a negative sign correctly throws the signed `Overflow` status flag.
4. **Logical Disjunctions & Bit Shifts:** Checked bitwise masking and shifting mechanics to guarantee flawless bus transitions across the time continuum.
