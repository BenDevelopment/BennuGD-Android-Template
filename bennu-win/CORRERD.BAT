@echo off
if exist C:\BennuGD\devBennu\bin\stderr.txt  del C:\BennuGD\devBennu\bin\stderr.txt
if exist C:\BennuGD\devBennu\bin\stdout.txt  del C:\BennuGD\devBennu\bin\stdout.txt
if exist %2.dcb    del %2.dcb
pushd  %3 
C:\BennuGD\devBennu\bin\bgdc.exe -g -d %1
if exist C:\BennuGD\devBennu\bin\stdout.txt   type C:\BennuGD\devBennu\bin\stdout.txt
if exist C:\BennuGD\devBennu\bin\stderr.txt   type C:\BennuGD\devBennu\bin\stderr.txt
if exist C:\BennuGD\devBennu\bin\stderr.txt   goto salida
C:\BennuGD\devBennu\bin\bgdi.exe -d %2
if exist C:\BennuGD\devBennu\bin\stderr.txt  type C:\BennuGD\devBennu\bin\stderr.txt
:salida
pause 
