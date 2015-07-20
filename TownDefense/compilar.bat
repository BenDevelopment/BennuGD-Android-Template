@echo off
cd src
echo Build in progress...
..\..\bennu-win\bgdc -D -g main.prg
move main.dcb ..
cd ..
..\bennu-win\bgdi main.dcb

exit