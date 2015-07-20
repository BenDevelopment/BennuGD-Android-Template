cd ..\utils
cd > tmp
set /p dirbase= < tmp
del /f tmp
set java_home=%dirbase%\jdk
set path=%path%;%dirbase%\ant\bin;%dirbase%\jdk;%dirbase%\jdk\bin;%dirbase%\jdk\jre;%dirbase%\jdk\jre\bin;%dirbase%;%dirbase%\android-sdk\platform-tools
set ant_home=%dirbase%\ant
set java_exe=%dirbase%\jdk\jre\bin\java.exe
set javacmd=%dirbase%\jdk\jre\bin\java.exe
cd ..\%1