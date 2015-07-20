cd fpg
ren *.fpg *.fpg.gz
rem ..\..\utils\gzip -d *.fpg.gz
for /f %%f in ('dir /b *.fpg.gz') do ..\..\utils\gzip -d %%f
ren *.fpg.gz *.
cd ..
