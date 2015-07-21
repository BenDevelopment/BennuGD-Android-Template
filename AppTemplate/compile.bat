@echo off
cd src
echo Build in progress...
..\..\bennu-win\bgdc -D -g main.prg -a
move main.dcb ..
pause
cd ..
..\bennu-win\bgdi main.dcb -a

pause
exit