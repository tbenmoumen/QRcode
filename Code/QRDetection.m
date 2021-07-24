function QRCode = QRDetection(Image)
ImageBinaire = binarisation(Image, 'otsu');
[type, rotation] = alternances(ImageBinaire);
while(rotation > 0)
    ImageBinaire = rotation90(ImageBinaire);
    rotation = rotation-1;
end
QRCode = synthese(ImageBinaire, type);
