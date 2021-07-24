function Values = histogramme(Image)

ktemp = histogram(Image);
Limits = ktemp.BinLimits(2);
k = histogram(Image, Limits);


Values = k.Values;
