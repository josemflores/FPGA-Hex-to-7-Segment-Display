# Hex to 7-Segment Display — DE10-Lite

A Verilog project for the **Intel DE10-Lite FPGA board** that takes a 4-bit hexadecimal input from the onboard switches and displays the corresponding digit on a 7-segment display.

---

## Overview

This project implements a hex-to-7-segment decoder in Verilog. A 4-bit value is read from the slide switches (`SW[3:0]`) and decoded into the correct segment signals to display the hex digit (`0`–`F`) on `HEX0`.

The design is split into two modules:

- **`golden_top.v`** — Top-level module, wires inputs/outputs to the board's pins
- **`logic.v`** — Hex decoder module, computes the 7 segment outputs from a 4-bit input

---

## Hardware

- **Board:** Intel DE10-Lite
- **Input:** `SW[3:0]` — 4 slide switches representing a 4-bit hex value
- **Output:** `HEX0[6:0]` — 7-segment display

---

## Segment Mapping

The DE10-Lite 7-segment displays are **active-low** — a `0` turns a segment ON, a `1` turns it OFF.

```
 _
|_|
|_|

HEX0[0] = a (top)
HEX0[1] = b (top-right)
HEX0[2] = c (bottom-right)
HEX0[3] = d (bottom)
HEX0[4] = e (bottom-left)
HEX0[5] = f (top-left)
HEX0[6] = g (middle)
```

---

## How It Works

1. The top-level module instantiates the hex decoder and connects its 7 output wires to `HEX0` using a single concatenated assignment:

```verilog
assign HEX0 = {seg_g, seg_f, seg_e, seg_d, seg_c, seg_b, seg_a};
```

2. The decoder uses a `case` statement to map each of the 16 hex values to the correct active-low segment pattern:

```verilog
case (hex_in)
    4'h0: segments = 7'b1000000;
    4'h1: segments = 7'b1111001;
    // ...
endcase
```

---

## Project Files

| File | Description |
|------|-------------|
| `golden_top.v` | Top-level module with pin connections |
| `logic.v` | Hex decoder logic module |
| `*.qpf` | Quartus project file |
| `*.qsf` | Quartus settings file (pin assignments) |

---

## Tools

- **Intel Quartus Prime** — Synthesis and programming
- **ModelSim** *(optional)* — Simulation
- **Git + GitHub** — Version control

---

## Getting Started

1. Clone the repo:
```bash
git clone https://github.com/josemflores/FPGA-Hex-to-7-Segment-Display.git
```

2. Open the `.qpf` file in Quartus Prime

3. Compile the project (**Processing → Start Compilation**)

4. Program the DE10-Lite via USB-Blaster (**Tools → Programmer**)

5. Flip `SW[3:0]` to input a hex value and watch `HEX0` update

---

## Authors

Jose Perez Flores - Electrical Engineering, University of Texas at Arlington

Marco Cruz - Electrical Engineering, University of Texas at Arlington

Hoang Phuong Vu - Electrical Engineering, University of Texas at Arlington
