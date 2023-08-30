@echo off
set/p ExeFileName="What do you want to name the file?(Do not include .exe at the end.)"
g++ -o %ExeFileName%.exe *.cpp
pause
