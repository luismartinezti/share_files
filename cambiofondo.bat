@echo off

set URL=https://img2.wallspic.com/previews/4/3/5/7/97534/97534-naturaleza-bosque-la_vegetacion-ecosistema-los_bosques_de_viejo_crecimiento-x750.jpg
set FILE=C:\wallpaper.jpg

:: Descargar imagen con TLS
powershell -ExecutionPolicy Bypass -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%URL%' -OutFile '%FILE%'"

:: Limpiar cache
del /f /q "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper" 2>nul
del /f /q "%APPDATA%\Microsoft\Windows\Themes\CachedFiles\*" 2>nul

:: Aplicar fondo (versión simple)
powershell -ExecutionPolicy Bypass -command "(Add-Type '[DllImport(\"user32.dll\")]public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni);' -Name a -Pas)::SystemParametersInfo(20,0,'%FILE%',3)"

exit
