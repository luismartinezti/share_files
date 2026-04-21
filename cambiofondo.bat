@echo off

:: URL de la imagen
set URL=https://img2.wallspic.com/previews/4/3/5/7/97534/97534-naturaleza-bosque-la_vegetacion-ecosistema-los_bosques_de_viejo_crecimiento-x750.jpg

:: Ruta donde se guardará
set FILE=%TEMP%\wallpaper.jpg

:: Descargar imagen (PowerShell)
powershell -command "Invoke-WebRequest -Uri '%URL%' -OutFile '%FILE%'"

:: Cambiar fondo de pantalla
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%FILE%" /f

:: Aplicar cambios
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

exit
