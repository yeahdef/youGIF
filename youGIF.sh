#!/bin/bash

echo 'what is the URL of the youtube video you want to GIF?'
read URL
echo -e 'what time should the GIF start? \n(use X:XX.XX format)'
read START
echo 'how many seconds should it last?'
read LENGTH
echo 'what should I name the GIF?'
read NAME

youtube-dl -o temp -f 18 $URL;

while [ "$OK" != "y" ]; do
	
	mplayer temp -ss $START -endpos $LENGTH -loop 0 -vf scale=200:-2 -nosound;

	echo -e '\n\ndoes this look good? \ny/n?'
	read OK
	if [ "$OK" = "y" ]; then
		break
	else
		echo -e 'what should the new starting point? \n(use X:XX.XX format)'
		read START
		echo 'what should be the new length in seconds?'
		read LENGTH
	fi
done

mplayer temp -ss $START -endpos $LENGTH -vo jpeg:outdir=frames:quality=100:smooth=20 -vf scale=200:-2 -nosound;
convert -delay 4 -loop 0 frames/*.jpg $NAME.gif;
rm frames/*.jpg;
rmdir frames;
rm temp;
