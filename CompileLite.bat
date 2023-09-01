@echo off
forfiles /M *.cpp /c "cmd /c g++ -Wall -std=c++14 *.cpp -o @fname.exe"
pause