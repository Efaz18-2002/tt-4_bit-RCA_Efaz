---
title: 4-bit Ripple Carry Adder
---

## How it works

This design implements a 4-bit Ripple Carry Adder (RCA) built
from four 1-bit full-adder modules connected in a ripple-carry
chain. Each full adder computes the sum and carry-out of its
bit position. The carry-out of each stage feeds into the
carry-in of the next stage, propagating from the
least-significant bit (FA0) to the most-significant bit (FA3).

The carry-in of FA0 is hardwired to 0.

Inputs A[3:0] are mapped to ui_in[3:0].
Inputs B[3:0] are mapped to ui_in[7:4].
The 4-bit sum S[3:0] appears on uo_out[3:0].
The carry-out appears on uo_out[4].
The design is purely combinational — no clock is used.

## How to test

Set ui_in[3:0] to the 4-bit value of A and ui_in[7:4] to the
4-bit value of B. Read the sum from uo_out[3:0] and the
carry-out from uo_out[4].

Example 1: A=7 (0111), B=8 (1000) → ui_in=10000111
Expected: S=15 (1111), Cout=0 → uo_out=00001111

Example 2: A=15 (1111), B=15 (1111) → ui_in=11111111
Expected: S=14 (1110), Cout=1 → uo_out=00011110
