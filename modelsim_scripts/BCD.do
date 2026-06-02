vsim -gui work.BinBCD
add wave -position insertpoint  \
sim:/BinBCD/binary \
sim:/BinBCD/ones \
sim:/BinBCD/tens
force -freeze sim:/BinBCD/binary 0000 0
run
force -freeze sim:/BinBCD/binary 0101 0
run
force -freeze sim:/BinBCD/binary 1010 0
run
force -freeze sim:/BinBCD/binary 1111 0
run