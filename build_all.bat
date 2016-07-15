@echo off

call "ctime" -begin 4ed_data.ctm

set OPTS=/W4 /wd4310 /wd4100 /wd4201 /wd4505 /wd4996 /wd4127 /wd4510 /wd4512 /wd4610 /wd4390 /WX
set OPTS=%OPTS% /GR- /EHa- /nologo /FC
set INCLUDES=/I..\foreign /I..\foreign\freetype2
set LIBS=user32.lib winmm.lib gdi32.lib opengl32.lib
set LIBS=%LIBS% ..\foreign\freetype.lib
set ICON=..\res\icon.res
set DEFINES=
set FirstError=0

pushd ..\meta
cl %OPTS% ..\code\4ed_metagen.cpp %* /Femetagen
if %ERRORLEVEL% neq 0 (set FirstError=1)
popd

pushd ..\code
"..\meta\metagen"
if %ERRORLEVEL% neq 0 (set FirstError=1)

set CODE_DIR=%CD%
popd

pushd ..\build

REM call "%CODE_DIR%\buildsuper.bat" ..\code\4coder_default_bindings.cpp
REM call "%CODE_DIR%\buildsuper.bat" ..\code\power\4coder_experiments.cpp
call "%CODE_DIR%\buildsuper.bat" ..\code\power\4coder_casey.cpp
REM call "%CODE_DIR%\buildsuper.bat" ..\4vim\4coder_chronal.cpp
if %ERRORLEVEL% neq 0 (set FirstError=1)

set EXPORTS=/EXPORT:app_get_functions
cl %OPTS% %INCLUDES% %DEFINES% %CODE_DIR%\4ed_app_target.cpp %* /Fe4ed_app /LD /link /INCREMENTAL:NO /OPT:REF %EXPORTS%
if %ERRORLEVEL% neq 0 (set FirstError=1)

cl %OPTS% %INCLUDES% %DEFINES% %CODE_DIR%\win32_4ed.cpp %LIBS% %ICON% %* /Fe4ed /link /NODEFAULTLIB:library
if %ERRORLEVEL% neq 0 (set FirstError=1)

call "print_size.bat" 4ed_app.dll
call "print_size.bat" 4ed.exe

popd

call "ctime" -end 4ed_data.ctm %FirstError%




