vsim -gui work.Stopwatch
add wave -position insertpoint  \
sim:/Stopwatch/clk \
sim:/Stopwatch/rst \
sim:/Stopwatch/CountUpOrDown \
sim:/Stopwatch/Q1 \
sim:/Stopwatch/Q2 \
sim:/Stopwatch/Q3 \
sim:/Stopwatch/Q4
force -freeze sim:/Stopwatch/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Stopwatch/rst 1 0
force -freeze sim:/Stopwatch/CountUpOrDown 0 0
run
force -freeze sim:/Stopwatch/rst 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run