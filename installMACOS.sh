#!/bin/bash

# Install Python and pip
brew install python3

# Install necessary packages
pip3 install pytube moviepy pyinstaller

# Turn the downloader into an executable
pyinstaller --onefile --windowed download.py

# Ask the user if they want to create a desktop shortcut
read -p "Do you want to create a desktop shortcut (Y/N)? " createShortcut
if [ "$createShortcut" = "Y" ] || [ "$createShortcut" = "y" ]; then
    # Create the .app bundle
    mkdir -p YoutubeDownloader.app/Contents/MacOS
    cp dist/download YoutubeDownloader.app/Contents/MacOS/YoutubeDownloader
    cp resources/icon.icns YoutubeDownloader.app/Contents/Resources/icon.icns

    # Create the Info.plist file
    echo '<?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>CFBundleExecutable</key>
        <string>YoutubeDownloader</string>
        <key>CFBundleIconFile</key>
        <string>icon.icns</string>
    </dict>
    </plist>' > YoutubeDownloader.app/Contents/Info.plist

    # Create the desktop shortcut
    ln -s $(pwd)/YoutubeDownloader.app ~/Desktop/YoutubeDownloader
    echo "---------Shortcut created.---------"
else
    echo "---------Shortcut not created.---------"
fi