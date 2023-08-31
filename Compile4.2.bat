@echo off
Echo %time%>>Debug.txt
Echo Loading Compiler Version 4.2 (Copywrite 2023)
timeout /T 2 /NOBREAK >>nul
Echo Check Debug.txt for errors
Echo Compiler Loaded!
Echo Available files to compile: 
forfiles /M *.cpp /c "cmd /c echo @fname"
pause
Echo What file do you want to compile? (Don't put .cpp at the end)
set/p CppFile=
Echo What do you want to name the file? (Don't put .exe at the end.)
set/p ExeFileName=
Echo What level of optimization? (Set to -o if you don't know what this means or don't have the right software for it.)
Echo Available optimizations are -o,-o1,-o2,-o3.
set/p Optimization=
Echo Would you like to run the file when it is finished compiling?
set/p run=
if exist Previous_Version (
goto :skip
)
forfiles /M %ExeFileName%.exe /c "cmd /c mkdir "Previous_Version"" 2>>Debug.txt
forfiles /M %ExeFileName%.exe /c "cmd /c move "%ExeFileName%.exe" "Previous_Version"" 2>>Debug.txt
:skip
Echo If there were any errors compiling, they will appear here:
g++ %Optimization% %ExeFileName%.exe %CppFile%.cpp
forfiles /M *.exe /c "cmd /c echo Successfully created %ExeFileName%.exe!" 2>>Debug.txt
Echo All current .exe files in the current folder:
forfiles /M *.exe /c "cmd /c echo @fname" 2>>Debug.txt
if %run%== yes (
start %ExeFileName%.exe
) else (
pause
)