vlib work


vlog counter.v 
vlog -sv counter_pkg.sv tb_top.sv

vsim -voptargs="+acc" tb_top +UVM_TESTNAME=counter_test

add wave -position insertpoint sim:/tb_top/vif/*
add wave -position insertpoint sim:/tb_top/dut/*

run -all
