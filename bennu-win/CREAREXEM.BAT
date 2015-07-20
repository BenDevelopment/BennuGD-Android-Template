@echo off
if exist C:\BennuGD\devBennu\bin\stderr.txt  del C:\BennuGD\devBennu\bin\stderr.txt
if exist C:\BennuGD\devBennu\bin\stdout.txt  del C:\BennuGD\devBennu\bin\stdout.txt
if exist %2.dcb    del %2.dcb
pushd  %3 
C:\BennuGD\devBennu\bin\bgdc.exe -s bgdi -Ca -a %1 






pause 
