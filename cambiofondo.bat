@echo off
:: Ruta de la nueva imagen
set "https://img2.wallspic.com/previews/4/3/5/7/97534/97534-naturaleza-bosque-la_vegetacion-ecosistema-los_bosques_de_viejo_crecimiento-x750.jpg"

:: Cambiar fondo en el registro
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper%" /f

:: Actualizar la pantalla
%SystemRoot%\System32\rundll32.exe user32.dll, UpdatePerUserSystemParameters
