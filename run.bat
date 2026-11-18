@echo off
rem OmniRouteService menu. The service runs from docker-compose.yml on the ZimaOS server; this folder is copied there.
cd /d "%~dp0"
set HOST=lex@scutiserver1.local
set DEST=/media/ZimaOS-HD/Apps/ModelEngines
if /i "%~1"=="deploy" goto deploy

:menu
echo.
echo OmniRouteService
echo.
echo   1  Deploy ^(copy this folder to the server, starts nothing^)
echo   Q  Quit
echo.
choice /c 1Q /n /m "What do you want to do? "
if errorlevel 2 exit /b 0

:deploy
cd /d "%~dp0.."
echo Copying OmniRouteService to %HOST%:%DEST% ...
ssh %HOST% "mkdir -p %DEST%" || goto fail
scp -r OmniRouteService %HOST%:%DEST%/ || goto fail

echo Done.
pause
exit /b 0

:fail
echo Copy failed.
pause
exit /b 1
