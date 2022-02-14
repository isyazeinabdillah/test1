#!/bin/bash

/usr/bin/docker run --rm -v /opt/stream1/test-tembak:/root:ro --name test-tembak jrottenberg/ffmpeg:4.1-alpine -re -f concat -i /root/loop1000.txt -vcodec libx264 -profile:v main -preset:v medium -r 30 -g 60 -keyint_min 60 -sc_threshold 0 -b:v 2500k -maxrate 2500k -bufsize 2500k -acodec libfdk_aac -b:a 96k -ar 48000 -ac 2 -f flv rtmp://10.148.0.2:1935/rtmp-livestream/livestream
