function QRImage = synthese(BinImage, type)

if(type>40) %type inconnu => reconnaissance non effectuée
    QRImage = -1;
else

    NbPixQR = 17+4*type; % type directement relié au nombre de pixels
    QRImage = zeros(NbPixQR);
    dim = size(BinImage);
    tailleInitiale = dim(1);
    tailleFinale = NbPixQR;
    pixelsParCarreau = tailleInitiale/tailleFinale;

    for i = 1:NbPixQR
        for j = 1:NbPixQR
            y = round(pixelsParCarreau*(-1+2*j)/2);
            x = round(pixelsParCarreau*(-1+2*i)/2);
            if(y <= 0 && y <= 0)
                QRImage(j,i) = BinImage(y+1, x+1);
            elseif(y <= 0)
                QRImage(j,i) = BinImage(y+1, x);
            elseif(x <= 0)
                QRImage(j,i) = BinImage(y, x+1);
            else
                QRImage(j,i) = BinImage(y, x);
            end

        end
    end
end