#!/bin/bash

# Install Python and pip
sudo apt update
sudo apt install -y python3 python3-pip

# Install necessary packages
pip3 install pytube moviepy pyinstaller

# Turn the downloader into an executable
pyinstaller --onefile --windowed download.py

# Ask the user if they want to create a desktop shortcut
read -p "Do you want to create a desktop shortcut (Y/N)? " createShortcut
if [ "$createShortcut" = "Y" ] || [ "$createShortcut" = "y" ]; then
    # Copy the icon to a directory listed in the Icon Theme Specification
    sudo cp $(pwd)/resources/icon.svg /usr/share/icons

    # Create the shortcut
    echo -e "[Desktop Entry]\nType=Application\nExec=$(pwd)/dist/download\nIcon=/usr/share/icons/icon.png\nName=YoutubeDownloader" > ~/Desktop/YoutubeDownloader.desktop
    chmod +x ~/Desktop/YoutubeDownloader.desktop
    echo "---------Shortcut created.---------"
else
    echo "---------Shortcut not created.---------"
fi