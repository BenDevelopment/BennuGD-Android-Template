@echo off
ECHO CREANDO FPGS...
cd fpg-sources
rem copy ..\..\utils\pxlfpg.dcb . /y
rem ..\..\bennu-win\bgdi pxlfpg %*
rem del /f pxlfpg.dcb
..\..\bennu-win\bgdi ..\..\utils\pxlfpg.dcb %*
cd ..