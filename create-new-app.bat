@echo off
set /p studio_name=Enter the new studio name : 
set studio_name_nospaces=%studio_name: =%

set /p app_name=Enter the new app name : 
set app_name_nospaces=%app_name: =%

mkdir %app_name_nospaces%
xcopy /r/e/y AppTemplate %app_name_nospaces%
mkdir %app_name_nospaces%\resources\android\com\%studio_name_nospaces%\%app_name_nospaces%
copy "%app_name_nospaces%\resources\android\com\YourStudioName\YourAppName\YourAppName.java" "%app_name_nospaces%\resources\android\com\%studio_name_nospaces%\%app_name_nospaces%\%app_name_nospaces%.java"
rmdir /s /q %app_name_nospaces%\resources\android\com\YourStudioName
call utils\fart.exe -i -r "%app_name_nospaces%\*.*" YourAppName %app_name_nospaces%
call utils\fart.exe -i -r "%app_name_nospaces%\*.*" YourStudioName %studio_name_nospaces%
call utils\fart.exe -i -r "%app_name_nospaces%\*.*" YourDisplayedAppName "%app_name%"
cls
echo New app successfully created !
pause

