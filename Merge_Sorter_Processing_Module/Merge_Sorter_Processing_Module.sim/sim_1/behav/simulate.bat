@echo off
set xv_path=C:\\Development\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xsim processing_module_tb_behav -key {Behavioral:sim_1:Functional:processing_module_tb} -tclbatch processing_module_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
