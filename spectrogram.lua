require 'audio'
require 'image' -- to display the spectrogram
require 'torch'

local fname = arg[1]
voice = audio.load(fname)
--spect = audio.spectrogram(voice, 8192, 'hann', 512)
spect = audio.spectrogram(voice, 8192, 'hann', 512)

image.display(spect)
img = image.toDisplayTensor(spect)
imgNarrow = img:narrow(1,3072,1024)
--filename = io.read()
image.save(fname .. '.pgm',imgNarrow)
