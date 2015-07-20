@echo off
echo BENNU FUNCTIONS > function-list.txt
echo --------------- >> function-list.txt
for %%i in (lib*.dll) do echo %%i && moddesc -i- %%i >> function-list.txt && echo ------------------------------------------------------- >> function-list.txt
for %%i in (mod*.dll) do echo %%i && moddesc -i- %%i >> function-list.txt && echo ------------------------------------------------------- >> function-list.txt

