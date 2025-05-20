#!/bin/bash
cd /home/janik/media/DnB/
yt-dlp --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s" --yes-playlist --playlist-end 50 --cookies '/home/janik/cookies' --extractor-args youtubetab:skip=authcheck 'https://www.youtube.com/playlist?list=PLfJs1FDl9C2sYXOrALpgoKwYqbm6Cq49i' 
