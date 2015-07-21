@echo off

set bits=%1
if "%bits%"==""; set bits=32
call ..\scripts\compilefpgs.bat %bits%