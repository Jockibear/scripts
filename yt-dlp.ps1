cd "D:\yt-dlp\media\"
yt-dlp --yes-playlist --playlist-end 20 --extract-audio --audio-format mp3 --remote-components ejs:npm --output "%(title)s.%(ext)s" 'https://www.youtube.com/playlist?list=PLfJs1FDl9C2sYXOrALpgoKwYqbm6Cq49i'
cp D:\yt-dlp\media\* Z:\yt-dlp\
cd "D:\yt-dlp\metal\"
yt-dlp --yes-playlist --playlist-start 20 --playlist-reverse --extract-audio --audio-format mp3 --remote-components ejs:npm --output "%(title)s.%(ext)s" 'https://www.youtube.com/playlist?list=PLfJs1FDl9C2sTXDVGs6IDQjvgfw3KLsWx'
cp D:\yt-dlp\metal\* Z:\yt-dlp_metal\