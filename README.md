# Verilog-Implementation-of-a-32-point-IFFT-Circuit
A FIFO structure is implemented to hold input and output data. There are 32 pairs of real and imaginary inputs, consisting of 4-bit integer and 24-bit decimal values each. The 32-point IFFT has 5 layers with 32 butterflies each. The device operates with a speed of 200MHz.


- ifft.v		top module, a 32-point IFFT with 4-bit integer and 24-bit decimal real and image input/output
- ifft2.v		sub-module, collecting signals from bfly.v and commul.v
- bfly.v		sub-module, an adder and subtractor for the butterfly structure
- commul.v		sub-module, a multiplier for the twiddle factor of the butterfly structure
- ifft_tb.v		a testbench for ifft.v
- ifft2_tb.v		a testbench for ifft2.v
- bfly_tb.v		a testbench for bfly2.v
- commul_tb.v		a testbench for commul.v
