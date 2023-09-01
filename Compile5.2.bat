@echo off
Echo %time%>>Debug.txt
Echo Loading Compiler Version 5.1 (Copywrite 2023)
timeout /T 2 /NOBREAK >>nul
Echo Check Debug.txt for errors
Echo Compiler Loaded!
Echo Available files to compile: 
forfiles /M *.cpp /c "cmd /c echo @fname"
pause
Echo Would you like to auto-compile the cpp file? (Only available when there is only one cpp file present.)
set/p auto-compile=
if %auto-compile%== yes (
goto :NO-QUESTIONS
)
Echo What file do you want to compile? (Don't put .cpp at the end)
set/p CppFile=
Echo What do you want to name the file? (Don't put .exe at the end.)
set/p ExeFileName=
Echo What flags do you want to add? (-Wall -Wextra -Wpedantic)
set/p Flags=
Echo Would you like to run the file when it is finished compiling?
set/p run=
:NO-QUESTIONS
if exist Previous_Version (
goto :skip
)
forfiles /M *.exe /c "cmd /c mkdir "Previous_Version"" 2>>Debug.txt
forfiles /M *.exe /c "cmd /c move "@fname.exe" "Previous_Version"" >nul 2>>Debug.txt
if %auto-compile%== yes (
goto :COMPILE
)
:skip
Echo If there were any errors compiling, they will appear in Debug.txt
timeout /T 1 /NOBREAK >nul
g++ %Flags% -std=c++14 %CppFile%.cpp -o %ExeFileName%.exe 2>>Debug.txt
forfiles /M *.exe /c "cmd /c echo Successfully created %ExeFileName%.exe!" 2>>Debug.txt
Echo All current .exe files in the current folder:
forfiles /M *.exe /c "cmd /c echo @fname" 2>>Debug.txt
if %run%== yes (
start %ExeFileName%.exe
exit
) else (
pause
exit
)
:COMPILE
Echo Would you like to run the .exe when it is compiled?
set/p run=
forfiles /M *.cpp /c "cmd /c g++ -Wall -std=c++14 *.cpp -o @fname" 2>>Debug.txt
:RUN
if %run%== yes (
timeout /T 1 /NOBREAK >>nul
Echo Running executable...
forfiles /M *.exe /c "cmd /c @fname" 2>>Debug.txt
pause
) else (
pause
)