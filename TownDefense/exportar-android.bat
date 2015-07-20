@echo off
cls
for %%* in (.) do set project_name=%%~n*
echo Project's name is : %project_name%
pause
call ..\utils\entorno.bat %project_name%

rd /s /q export
echo Compile...
cd src
..\..\bennu-win\bgdc -D TACTIL=1 main.prg
move main.dcb ..\main.dcb
cd ..

REM call compilarfpgs 16
call ..\scripts\descomprimefpgs.bat

echo Exporting...
mkdir export
echo Copying base Bennu-android...
xcopy /r/e/y ..\bennu-android .\export

echo Creating folders...
mkdir export\assets\fpg
mkdir export\assets\ogg
mkdir export\assets\wav

echo Copying resources from android...
copy recursos\android\hdpi.png export\res\drawable-hdpi\icon.png /y
copy recursos\android\ldpi.png export\res\drawable-ldpi\icon.png /y
copy recursos\android\mdpi.png export\res\drawable-mdpi\icon.png /y
copy recursos\android\xhdpi.png export\res\drawable-xhdpi\icon.png /y

copy recursos\android\strings.xml export\res\values\strings.xml /y
copy recursos\android\AndroidManifest.xml export\ /y
copy recursos\android\build.xml export\ /y

mkdir export\src\com
xcopy /r/e/y recursos\android\com export\src\com

echo Copying the game...
copy loading.png export\assets /y
copy fpg\*.fpg export\assets\fpg /y
copy ogg\*.ogg export\assets\ogg /y
copy wav\*.wav export\assets\wav /y
copy main.dcb export\assets /y

echo Export done. Trying to install on the Android device...

cd export
..\..\scripts\genera-apk.bat
pause