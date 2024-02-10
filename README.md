
# Youtube MP3/MP4 Downloader

This is a little "program" I made because I was tired of all the **ads** / **viruses** on such sites.

# How to install

It's pretty easy, all you have to do is run one of the files below.<br>
It will automatically install every package that is necessary for the program to work correctly, aswell as latest version of python. During installation you can choose whether you want to create a Desktop Shortcut of the program.

# Windows:

Run the **install.bat**

# Linux

Run the **install.sh**

# MacOS

Run the **installMACOS.sh**

---

If you want to do it manually follow this :

# Windows:

- Install latest version of Python from the [official website](https://www.python.org/downloads/)

- Open a terminal inside the folder where you downloaded the program.

- Type:<br>
`pip install pytube` <br>
`pip install moviepy` <br>
`pip install pyinstaller` <br>

- In order to turn the program into an executable <br>
type `pyinstaller --onefile --windowed --icon=resources/icon.ico download.py`

# Linux:

- Install Python and Pip<br>
`sudo apt update`<br>
`sudo apt install -y python3 python3-pip`

- Install necessary packages <br>
`pip3 install pytube moviepy pyinstaller`

- You can turn it into an executable <br>
`pyinstaller --onefile --windowed --icon=resources/icon.ico download.py`<br>
or you can execute with `python3 download.py`

# MacOS

- Install Brew <br>
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


- Install Python <br>
`brew install python3`

- Install necessary packages <br>
`pip3 install pytube moviepy pyinstaller
`

- Same as Linux users you have choice to install it as an executable by running the same command or execute it through the console by using <br>
`python3 download.py`

