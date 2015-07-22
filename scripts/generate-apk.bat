set /p keystore_name=Enter the name of your KeyStore : 
echo %CD%
set /p alias_name=Enter the alias : 
@echo key.alias=%alias_name%>>build.properties
cmd /c if exist ..\..\%keystore_name%.keystore ant release install
cmd /c if not exist ..\..\%keystore_name%.keystore ant debug install
cd bin
mkdir ..\..\..\temp 2> NUL
copy /y *release.apk ..\..\..\temp
start ..\..\..\temp &
taskkill /im adb.exe /f
pause

REM -------------------------------------------------------
REM TODO : PROPOSER LE CHOIX DU KEYSTORE
REM -------------------------------------------------------
REM :start 
REM set keystore_name=
REM set /p keystore_name=Enter the name of your KeyStore (or type enter to install in debug mode) : 
REM if "%keystore_name%"=="" echo Debug install...
REM cmd /c if "%keystore_name%"=="" ant debug install
REM cmd /c if exist ..\%keystore_name%.keystore ant release install
REM if not exist ..\%keystore_name%.keystore echo KeyStore not found
REM if not exist ..\%keystore_name%.keystore goto :start
REM cd bin
REM mkdir ..\..\..\temp 2> NUL
REM copy /y *release.apk ..\..\..\temp
REM start ..\..\..\temp &
REM taskkill /im adb.exe /f
REM pause


REM -------------------------------------------------------
REM ORIGINAL SCRIPT :
REM -------------------------------------------------------
REM if exist c:\unigames.build.properties copy c:\unigames.build.properties build.properties /y
REM cmd /c if exist c:\unigames.keystore ant release install
REM cmd /c if not exist c:\unigames.keystore ant debug install
REM cd bin
REM mkdir ..\..\..\temp 2> NUL
REM copy /y *release.apk ..\..\..\temp
REM start ..\..\..\temp &
REM taskkill /im adb.exe /f
REM pause