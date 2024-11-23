# CPU
Here is an example of a simple CPU-bound program written in x86 Assembly. This program demonstrates how to perform basic computations, focusing entirely on keeping the CPU busy with calculations.

The example calculates the sum of numbers from 1 to a given limit (n), which is a common workload for a CPU-bound task.

Explanation:

1. Data Section:

 - Defines a limit (100) as the upper bound for the sum.

 - Includes a placeholder for the computed result.
   
Sum Computation:

 - A loop iterates from 0 to the limit, adding the counter to the accumulator (eax).
   
Helper Functions:

 - print_string: Prints a string to the terminal.

 - int_to_str: Converts the result (integer) into a string for display.
   
Output:

 - Displays the computed sum.

How to Run:

 -Download the file cpu.asm

Assemble and link:

 -nasm -f elf64 cpu.asm -o cpu.o
  
 -ld cpu.o -o cpu

Run:

 -./cpu

If the limit is 100, the output should be:

 -Sum:5050

This program demonstrates a simple CPU task. You can modify the limit value to test different workloads.
