@echo off
Echo Loading Compiler Version 4.0 (Copywrite 2023)
timeout /T 2 /NOBREAK
Echo Compiler Loaded!
Echo Ignore error message "Files of type "*.exe" not found."
if exist Previous_Version (
goto :skip
)
forfiles /M *.exe /c "cmd /c mkdir "Previous_Version""
forfiles /M *.exe /c "cmd /c move "*.exe" "Previous_Version" 
:skip
Echo Available files to compile: 
forfiles /M *.cpp /c "cmd /c echo @fname"
pause
Echo What file do you want to compile? (Don't put .cpp at the end)
set/p CppFile=
Echo What do you want to name the file? (Don't put .exe at the end.)
set/p ExeFileName=
forfiles /M *.exe /c "cmd /c move "%ExeFileName%.exe" "Previous_Version" 
g++ -o %ExeFileName%.exe %CppFile%.cpp
forfiles /M *.exe /c "cmd /c echo Successfully created %ExeFileName%.exe!"
Echo All current .exe files in the current folder:
forfiles /M *.exe /c "cmd /c echo @fname"
pause
