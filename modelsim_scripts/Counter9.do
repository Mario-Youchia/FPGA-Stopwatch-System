vsim -gui work.Counter9
add wave -position insertpoint  \
sim:/Counter9/clk \
sim:/Counter9/rst \
sim:/Counter9/CountUpOrDown \
sim:/Counter9/Q \
sim:/Counter9/clk2
force -freeze sim:/Counter9/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Counter9/rst 1 0
force -freeze sim:/Counter9/CountUpOrDown 0 0
run
force -freeze sim:/Counter9/rst 0 0
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