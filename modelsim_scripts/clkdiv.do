vsim -gui work.clkdiv
add wave -position insertpoint  \
sim:/clkdiv/DIVISOR \
sim:/clkdiv/clock_in \
sim:/clkdiv/reset \
sim:/clkdiv/clock_out \
sim:/clkdiv/counter
force -freeze sim:/clkdiv/reset 1'h0 0
force -freeze sim:/clkdiv/clock_in 1 0, 0 {10 ns} -r 20
run 100
force -freeze sim:/clkdiv/reset 1'h1 0
run 100
force -freeze sim:/clkdiv/reset 1'h0 0
run 2000000000