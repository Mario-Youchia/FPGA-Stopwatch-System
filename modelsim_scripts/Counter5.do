vsim -gui work.Counter5
add wave -position insertpoint  \
sim:/Counter5/clk \
sim:/Counter5/rst \
sim:/Counter5/CountUpOrDown \
sim:/Counter5/Q \
sim:/Counter5/clk2
force -freeze sim:/Counter5/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/Counter5/rst 1 0
force -freeze sim:/Counter5/CountUpOrDown 0 0
run
force -freeze sim:/Counter5/rst 0 0
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