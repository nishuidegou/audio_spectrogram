require 'audio'
require 'image' -- to display the spectrogram
require 'torch'

local fname = arg[1]
voice = audio.load(fname)
--spect = audio.spectrogram(voice, 8192, 'hann', 512)
spect = audio.spectrogram(voice, 8192, 'hann', 512)

--image.display(spect)
img = image.toDisplayTensor(spect)
imgNarrow = img:narrow(1,4096-256,256)
--filename = io.read()
image.save(fname .. '.pgm',imgNarrow)

-- cross-correlation
--[[
k = torch.rand(10,10)
corr = torch.xcorr2(imgNarrow,k)
conv = torch.conv2(imgNarrow,k)
--print(c:size())
image.display(corr)
image.display(conv)
--]]


k = torch.ones(255,255)
conv = torch.conv2(imgNarrow,k)
print(conv)
image.display(conv)

