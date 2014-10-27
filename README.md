youGIF
======

This script was written by Joey Liechty in Jan 2012.
It will create a nice looking gif from a youtube video URL.
You will need to install 3 libraries for it to work.

youtube-dl

mplayer

imagemagick

using apt-get or your package manager of choice, type `sudo apt-get install youtube-dl mplayer imagemagick`.
then, open up a bash shell.
type `./youGIF.sh`.
then follow the prompts.

After it downloads the video with youtube-dl, you will be looking at a loop of the segment of the video you specified with mplayer. If you like how it looks, reply 'y' after closing the video loop. If not, reply 'n', and you can redefine the range of the loop. You can give the starting point for the loop in the format of HH:MM:SS.ff (f for frame) and the duration of the loop in the format SS.ff (f for frame). After you are satisfied with your loop, it will spit the individual frames to a temporary directory beneath the current working directory, create a GIF from that with your specified name, trash the video and frame files, and then finally quit.
