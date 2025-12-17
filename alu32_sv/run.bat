@echo off
echo ===============================
echo  Building ALU 32-bit Project
echo ===============================

iverilog -g2012 -o sim.out alu_pkg.sv alu32.sv tb_alu32.sv

if errorlevel 1 (
    echo.
    echo Compile FAILED!
    pause
    exit /b
)

echo.
echo Running simulation...
vvp sim.out

echo.
echo Done.
pause
