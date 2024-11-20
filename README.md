# x86-64 DSA Solutions

Implemented classic algorithms and data structures in x86-64 assembly  
**Status: IN PROGRESS**

## Overview
This project contains implementations of various classic algorithms and data structures in **x86-64 assembly language**. The goal is to provide low-level solutions to fundamental computing problems, using the assembly language's full potential for performance optimization.

## Requirements

To assemble and link the code, you will need **nasm** (Netwide Assembler) and **ld** (GNU linker) installed on your system.

## Linux Setup

Use the following commands to assemble and link your assembly file:

```bash
nasm -f elf64 "FILENAME" && ld -o "FILENAME" "FILENAME.o" -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
```
Alternatively, you can download the bash script and use the command:
``` bash
./assembler.sh FILENAME
```
