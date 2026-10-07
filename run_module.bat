@echo off
title EMS - Manish Module (Core Dispatcher Console)
echo ==========================================================
echo EMS - MODULE 01: CENTRAL TACTICAL DISPATCHER CONSOLE
echo Lead Architect: Manish Kumar Sah (Full-Stack Lead)
echo ==========================================================
echo.
echo Launching standalone web server on port 8081...
echo Dispatcher Console will open at: http://localhost:8081/dispatcher/
echo Credentials:
echo   Username: admin
echo   Password: admin123
echo.
start "" http://localhost:8081/dispatcher/
python -m http.server 8081 --directory src\frontend
pause
