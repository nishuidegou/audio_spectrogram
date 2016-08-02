
input = io.read()
os.execute("ffmpeg -i " .. input .. ".m4a -acodec libmp3lame -ac 1 -ab 128k " .. input .. ".mp3")

