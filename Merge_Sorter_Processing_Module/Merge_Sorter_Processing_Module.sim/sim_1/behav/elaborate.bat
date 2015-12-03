@echo off
set xv_path=C:\\Development\\Xilinx\\Vivado\\2015.3\\bin
call %xv_path%/xelab  -wto 8ff87736a0c643d09c4829da0a3867ad -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot processing_module_tb_behav xil_defaultlib.processing_module_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
