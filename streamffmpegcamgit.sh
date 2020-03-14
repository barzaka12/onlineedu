# Made by barzaka12 & krokodilerian/maniax #
#!/bin/bash
sz=1280x720 #The resolution of your screen
rate=25 #The FPS to stream with
ffmpeg \
	-f v4l2 -framerate $rate -video_size $sz -r $rate -i /dev/video0 \ # "/dev/video0" is the camera you're capturing
 	-f alsa -ac 2 -i hw:1,0 \
 	-vcodec libx264 -threads 4 -r $rate -s "$sz" -g $rate -b:v 1000k -preset ultrafast -tune zerolatency \
	-acodec aac -ar 44100 -threads 2 -q:a 5 -ab 128k \
	-f flv rtmp:#The address to stream to HERE
