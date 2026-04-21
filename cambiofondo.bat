@echo off

set URL=https://img2.wallspic.com/previews/4/3/5/7/97534/97534-naturaleza-bosque-la_vegetacion-ecosistema-los_bosques_de_viejo_crecimiento-x750.jpg
set FILE=C:\wallpaper.jpg

:: Descargar imagen
powershell -command "Invoke-WebRequest -Uri '%URL%' -OutFile '%FILE%'"

:: Borrar cache
del /f /q "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper"
del /f /q "%APPDATA%\Microsoft\Windows\Themes\CachedFiles\*" 2>nul

:: Aplicar fondo
powershell -command "Add-Type @'
using System.Runtime.InteropServices;
public class Wallpaper {
[DllImport(\"user32.dll\",SetLastError=true)]
public static extern bool SystemParametersInfo(int uAction,int uParam,string lpvParam,int fuWinIni);
}
'@; [Wallpaper]::SystemParametersInfo(20,0,'%FILE%',3)"

exit
