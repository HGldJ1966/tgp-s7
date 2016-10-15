: TGP S7 Build Script v1.00 by djb77 / XDA Developers
: Build Date: 3rd October 2016

@echo off
cd "%~dp0"
set /p tgpversion=<tools\version
set /p tgpfirmware=<tools\firmware
set tgpfilename=TGP_G93xx_%tgpfirmware%_v%tgpversion%.zip
set javadetect=0
java -version
if errorlevel 0 set javadetect=1
del /f /q %tgpfilename%
cls
@echo TGP S7 Flashable Zip Builder
@echo ----------------------------
@echo.
@echo Creating %tgpfilename%
if exist "%programfiles(x86)%" (goto 64bit) else (goto 32bit)
:64bit
%~dp0tools\7za-x64.exe a -tzip "%tgpfilename%" "%~dp0build\*" -mx9 -r >nul
goto sign
:32bit
%~dp0tools\7za.exe a -tzip "%tgpfilename%" "%~dp0build\*" -mx9 -r >nul
:sign
if %javadetect% == 1 (
@echo Signing %tgpfilename%
ren %tgpfilename% old%tgpfilename%
java -jar %~dp0tools\signapk.jar %~dp0tools/testkey.x509.pem %~dp0tools/testkey.pk8 old%tgpfilename% %tgpfilename%
del /f /q old%tgpfilename%
)
@echo.
pause
