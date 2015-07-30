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

echo Exporting...
mkdir export
echo Copying base Bennu-android...
xcopy /r/e/y ..\bennu-android .\export

echo Copying resources from android...
copy resources\android\hdpi.png export\res\drawable-hdpi\icon.png /y
copy resources\android\ldpi.png export\res\drawable-ldpi\icon.png /y
copy resources\android\mdpi.png export\res\drawable-mdpi\icon.png /y
copy resources\android\xhdpi.png export\res\drawable-xhdpi\icon.png /y

copy resources\android\strings.xml export\res\values\strings.xml /y
copy resources\android\AndroidManifest.xml export\ /y
copy resources\android\build.xml export\ /y

mkdir export\src\com
xcopy /r/e/y resources\android\com export\src\com

echo Copying the game...
mkdir export\assets
xcopy /r/e/y src export\assets
copy main.dcb export\assets /y

echo Export done. Trying to install on the Android device...

cd export
..\..\scripts\generate-apk.bat
pause