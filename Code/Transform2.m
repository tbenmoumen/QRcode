function SquaredImage = Transform2(SourceImage, p1, p2, p3, p4)
% This function uses the transformation functions SortCoins, SquareLength,
% Coordinates and Bilin. It takes the source image (even RGV or indexed
% colors), the defined points p1, p2, p3 and p4 (no matter their orders)

SortedCoins = SortCoinsOpti(p1, p2, p3, p4);
M = SquareLength(SortedCoins);

x1 = 1;
x2 = x1 + M-1;
y1 = 1;
y2 = y1 + M-1;

DestPoints = [y1 x1;
              y1 x2;
              y2 x2;
              y2 x1];
          
H = homographyEstimate2(SortedCoins, DestPoints);
MM2coordinates = CoordinatesOpti2(SortedCoins, DestPoints, H);
SquaredImage = Bilin2(DestPoints, MM2coordinates, SourceImage);

