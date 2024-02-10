@echo off

:: Download the python installer
powershell -Command "Invoke-WebRequest -OutFile python_installer.exe https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe"

:: Install Python
start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: Delete the Installer
del python_installer.exe
:: Install necessary packages
pip install pytube
pip install moviepy
pip install pyinstaller

:: Turn the downloader into an executable
pyinstaller --onefile --windowed --icon=resources/icon.ico download.py

:: Path to the .exe file
set "exePath=%~dp0dist\download.exe"

:: Path to the shortcut
set "shortcutPath=%USERPROFILE%\Desktop\YoutubeDownloader.lnk"

:: Path to the icon
set "iconPath=%~dp0resources\icon.ico"

:: Ask the user if they want to create a shortcut
set /p createShortcut="Do you want to create a desktop shortcut (Y/N)? "
if /i "%createShortcut%"=="Y" (

:: Create the shortcut
    powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcutPath%'); $S.TargetPath = '%exePath%'; $S.IconLocation = '%iconPath%,0'; $S.Save()"
    echo ---------Shortcut created.---------
) else (
    echo ---------Shortcut not created.---------
)

pause