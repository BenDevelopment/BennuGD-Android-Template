@echo off
call ..\utils\entorno.bat YourAppName

rd /s /q export
echo Compilando...
cd src
..\..\bennu-win\bgdc -D OUYA=1 YourAppName.prg
move YourAppName.dcb ..\main.dcb
cd ..

call compilefpgs 16
call ..\scripts\decompressfpgs.bat

echo Exportando...
mkdir export
echo Copiando base de bennu-android...
xcopy /r/e/y ..\bennu-android .\export

echo Creando carpetas...
mkdir export\assets\fpg
mkdir export\assets\ogg
mkdir export\assets\wav

echo Copiando resources de android...
copy resources\android\hdpi.png export\res\drawable-hdpi\icon.png /y
copy resources\android\ldpi.png export\res\drawable-ldpi\icon.png /y
copy resources\android\mdpi.png export\res\drawable-mdpi\icon.png /y
copy resources\android\xhdpi.png export\res\drawable-mdpi\icon.png /y
copy resources\android\ouya_icon.png export\res\drawable-xhdpi\ouya_icon.png /y

copy resources\android\strings.xml export\res\values\strings.xml /y
copy resources\android\AndroidManifest.xml export\ /y
copy resources\android\build.xml export\ /y

mkdir export\src\com
xcopy /r/e/y resources\android\com export\src\com

echo Copiando el juego...
copy loading.png export\assets /y
copy fpg\*.fpg export\assets\fpg /y
copy ogg\*.ogg export\assets\ogg /y
copy wav\*.wav export\assets\wav /y
copy main.dcb export\assets /y

echo Exportado correctamente. Ahora se instalará en el móvil...

cd export
..\..\scripts\generate-apk.bat
pause