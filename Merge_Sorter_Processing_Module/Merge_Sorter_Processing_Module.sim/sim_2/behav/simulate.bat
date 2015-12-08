@echo off
set xv_path=C:\\Development\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xsim systolic_array_tb_behav -key {Behavioral:sim_2:Functional:systolic_array_tb} -tclbatch systolic_array_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
