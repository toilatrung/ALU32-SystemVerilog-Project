@echo off
echo ####################################
echo #      ALU 32-BIT SIMULATION       #
echo ####################################
echo.

:: Ask user for output file name
set /p OUTNAME=Enter output executable name (without .out): 

if "%OUTNAME%"=="" (
    echo.
    echo Output name cannot be empty!
    pause
    exit /b
)

set "OUTFILE=%OUTNAME%.out"

echo.
echo Output file will be: %OUTFILE%
echo.

:: Compile
echo Compiling...
iverilog -g2012 -o %OUTFILE% alu_pkg.sv alu32.sv tb_alu32.sv

if errorlevel 1 (
    echo.
    echo COMPILE FAILED!
    pause
    exit /b
)

echo.
echo Compile SUCCESSFUL.
echo.

:: Ask about VCD generation (SAFE WAY)
choice /C YN /M "Do you want to generate VCD waveform?"

if errorlevel 2 goto RUN_NO_VCD
if errorlevel 1 goto RUN_VCD

:RUN_VCD
echo.
echo Running simulation with waveform enabled...
vvp %OUTFILE%
goto END

:RUN_NO_VCD
echo.
echo Running simulation...
vvp %OUTFILE%
goto END

:END
echo.
echo Simulation finished successfully.
pause
