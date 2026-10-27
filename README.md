# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
- Carson Brown and Patrick McClain (GROUP 5)
## Summary
- In this lab we used Verilog to implement sequential logic and basic memory on a basys3 board. In d_latch, we built a 1-bit D latch that stores sw[0] when you press btnC and also shows Q and ~Q on led[0]and[1]. Byte_memory was the file that extended that same logic to 8 bits sharing one enable so that we could store all the 8 bytes at once. Demux routed both the 8bit and 1bit store signals to only the selected byte address and the mux chose which stored byte to display. We had memory_system which combined four of the byte_memory instances to form a 4 byte memory chosen by sw[7:6]. The result was a working 32-bit memory, once you selected an address from (00,01,10,11) you would set a byte with sw[15:8], press btnC to store it and each address kept it's value relative to which address.
  
## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
- Latches require combinational loops, so the output feeds back into the inputs. Structural verilog builds that loop from two cross coupled NOR gates. Vivado treats a combinational loop as a design error, so we use an always block with a reg declaration and that tells the program we intend to store a value.
  
### What is the meaning of always @(*) in a sensitivity block?
- The * means "evaluate this block again when a signal changes." It is used for combinational logic where the output should follow the inputs with no memory. Since every output is assigned in every case, there is nothing stored and no latch created.

### What importance is memory to digital circuits?
- Memory allows for a circuit to hold a specific value over time instead of only reacting to whatever is in the current input. If we didn't have this a circuit would forget everything the instant the input changed. It would be impossible without memory to store data, keep track of states or simply run a program. Using memory and allowing data to be stored lets us build more complex digital systems on top of each other.
