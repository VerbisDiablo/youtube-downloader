from __future__ import unicode_literals
import os
from pytube import YouTube
from moviepy.editor import AudioFileClip
import tkinter as tk
from tkinter import font
from tkinter import filedialog

# ----------FUNCTIONS----------

# Function to clear text
def clearText(text):
    text.delete('1.0','end')

# Function to download youtube video
def downloadVideo(link,label):
    inp = link.get("1.0","end-1c")
    youtubeObject = YouTube(inp)
    filename = "".join([c for c in youtubeObject.title if c.isalpha() or c.isdigit() or c==' ']).rstrip() + ".mp4"
    youtubeObject = youtubeObject.streams.get_highest_resolution()
    try:
        youtubeObject.download(output_path=directory)
        label.config(text="Download finished: " + filename)
    except:
        label.config(text="An error has occurred")

# Function to download MP3 from youtube video
def downloadSong(link, label):

    inp= link.get("1.0","end-1c")

    # Download the video
    yt = YouTube(inp)
    stream = yt.streams.filter(only_audio=True).first()
    temp_filename = "temp.mp4"
    stream.download(output_path=directory, filename=temp_filename)

    # Use the video title as the filename for the MP3 file
    filename = "".join([c for c in yt.title if c.isalpha() or c.isdigit() or c==' ']).rstrip() + ".mp3"

    # Convert the video to MP3
    clip = AudioFileClip(temp_filename)
    clip.write_audiofile(f"{directory}/{filename}")

    # Clean up the temporary file
    clip.close()
    os.remove(temp_filename)

    # Update the label
    label.config(text="Download finished: " + filename)

# Function that calls downloadSong or downloadVideo
def download(link,label):
    if(var.get() == "MP4"):
        downloadVideo(link,label)
    else:
        downloadSong(link,label)

# Function to choose directory
def choose_directory():
    global directory
    directory = filedialog.askdirectory()
    print(directory)

# ----------GUI----------
# Store directory


# Create the window
window = tk.Tk()
window.title("Youtube Video Downloader")

# Create frame for input text and clear button
frame = tk.Frame(window)
frame.pack()

# Font
Font = font.Font(family="Helvetica", size=14)

# Store choice
var = tk.StringVar(value="MP3")

# Options
mp3_button = tk.Radiobutton(frame, text="MP3", variable=var, value="MP3")
mp4_button = tk.Radiobutton(frame, text="MP4", variable=var, value="MP4")
mp3_button.pack(side=tk.LEFT)
mp4_button.pack(side=tk.LEFT)




# Create a label for download status
status = tk.Label(window,text="")
status.pack()

# Create the text input case
linktovideo = tk.Text(frame,
                    height=2,
                    width=20)
linktovideo.pack(side=tk.LEFT)

# Create clear text button
clear = tk.Button(frame,
                    text="Clear text",
                    font=Font,
                    padx=10,
                    pady=10,
                    command=lambda: clearText(linktovideo))
clear.pack(side=tk.RIGHT)

# Create the choose directory button
chooseDirectory = tk.Button(frame,
                            text="Choose Directory",
                            font= Font,
                            padx=10,
                            pady=10,
                            command=choose_directory)
chooseDirectory.pack(side=tk.RIGHT)

# Create the download button
button = tk.Button(window,
                    text="Download",
                    font=Font,
                    padx=10,
                    pady=10,
                    command=lambda: download(linktovideo,status))
button.pack()


# Start the window loop.
window.mainloop()