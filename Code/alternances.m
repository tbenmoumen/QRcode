function [type, rotation] = alternances(BinImage)
    boucle = 1;
    type = 1;
    rotation = 0;
    dim = size(BinImage);
    tailleInitiale = dim(1);

    Filtre = [0.08 0.08 0.08;
              0.08 0.36 0.08;
              0.08 0.08 0.08];

    % Détection des alternances de la 7e ligne et 7e colonne
    while(type <= 40 && boucle == 1)

        tailleFinale = 17+4*type;
        pixelsParCarreau = tailleInitiale/tailleFinale;

        Ligne7 = zeros(1, tailleFinale);
        Colonne7 = zeros(1, tailleFinale);
        LigneReelle = zeros(1, tailleFinale);
        ColonneReelle = zeros(1, tailleFinale);


        for i = 8:tailleFinale-7
            if(mod(i,2) == 0)
                Ligne7(i) = 1;
                Colonne7(i) = 1;
            end
        end

        for i = 1:tailleFinale
            x7 = round(pixelsParCarreau*6.5);
            y7 = x7;
            if(round(pixelsParCarreau*(-1+2*i)/2) > 1);
                x = round(pixelsParCarreau*(2*i-1)/2);
                y = x;
            else
                x = round(pixelsParCarreau*(2*i-1)/2) + 2;
                y = x;
            end

            LigneReelle(i) = round(sum(sum(Filtre.*BinImage(y7-1:y7+1, x-1:x+1))));
            ColonneReelle(i) = round(sum(sum(Filtre.*BinImage(y-1:y+1, x7-1:x7+1))));

        end

        if(sum(xor(Ligne7, LigneReelle)) == 0 && sum(xor(Colonne7, ColonneReelle)) == 0)
            boucle = 0;
        else
            if(rotation < 4)
                BinImage = rotation90(BinImage);
                rotation = rotation + 1;
            else
                boucle = 1;
                type = type+1;
                rotation = 0;
        end
    end
end


