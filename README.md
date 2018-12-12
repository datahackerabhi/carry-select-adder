# 16 bit Carry Select Adder

## Introduction
This repository contains the verilog source files and the test bench for a modified 16 bit Carry Select Adder.

## Explanation
The entire adder has been broken down into sub-modules and individual parts have been built in separate source files. The basic\_cell.v file contains the code for a simple 1-bit basic cell. The mux.v and mux\_4bit.v files contain a 1 bit and 4 bit mux respectively. The cla.v contains code for a carry lookahead adder. This is another type of fast adder and has been used here to reduce the critical path of the design. The carry lookahead adder uses a carry lookahead logic in order to precompute the carrys. This module has been separately developed in the cll.v file. Finally the csa.v file integrates all the other modules into a single adder.

## Architecture
Please refer to Pg. 336 of the book Computer System Design and Architecture by Vincent P. Heuring and Harry F. Jordan.

## Testing
This code has been tested on Ubuntu 18.04 and 16.04 using the iverilog command line tool. The gtkwave tool was used to visualize the traces.
