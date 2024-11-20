#!/bin/bash

FILE=$1
nasm -f elf64 "$FILE" && ld -o "${FILE%.*}" "${FILE%.*}.o" -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
