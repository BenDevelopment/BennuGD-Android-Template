@echo off
cd src
echo Compilando...
..\..\bennu-win\bgdc YourAppName.prg
move YourAppName.dcb ..
cd ..

echo Exportando...
mkdir export
mkdir export\fpg
mkdir export\ogg
mkdir export\wav

copy fpg\*.fpg export\fpg
copy ogg\*.ogg export\ogg
copy wav\*.wav export\wav
copy ..\bennu-win\*.dll export
copy ..\bennu-win\bgdi.exe export\YourAppName.exe
copy YourAppName.dcb export