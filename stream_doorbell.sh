#!/bin/sh
script_dir="$(dirname "$0")"
. "$script_dir/credentials.sh"

ffmpeg -i "rtsp://${CAM_USER}:${CAM_PASS}@${CAM_IP}/onvif1" -preset veryfast -tune zerolatency -maxrate 750k -bufsize 1500k -video_size 1280x720  -vcodec libx264 -g 8 -r 4 -f flv -strict -2 -acodec aac rtmp://${SERVER_URL}:1935/app/stream


