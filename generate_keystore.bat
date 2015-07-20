@echo off
set /p key_name=Enter the key name : 
set /p alias_name=Enter the alias :
"utils\jdk\bin\keytool.exe" -v -genkey -v -keystore %key_name%.keystore -alias %alias_name% -keyalg RSA -validity 10000
move "utils\jdk\bin\%key_name%.keystore" ""
set currentpath=%~dp0
set currentpath=%currentpath:\=/%
@echo key.store=%currentpath%%key_name%.keystore>bennu-android/build.properties
@echo key.alias=%alias_name%>>bennu-android/build.properties