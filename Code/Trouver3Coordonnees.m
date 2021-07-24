function [Coordinates, FactorF] = Trouver3Coordonnees(Image)

Coordinates = [0 0];
FactorF = 0;
for n = 1:3
    i = 0;
    seuil =-1;
    Max = 0;
    while(Max > seuil && i < 200) %% 200: valeur arbitraire, pour que ce soit "assez grand"
        C = CorrelationAvecMotif(Image, 1.02^i);
        Max = max(max(C));
        [j, k] = find(C == Max);
        if(Max*2/3 > seuil)
            seuil = Max*2/3;
            Factor = i;
        end
        i = i+1;
    end
    C = CorrelationAvecMotif(Image, 1.02^Factor);
    FactorF = FactorF + Factor;
    Max = max(max(C));
    [j, k] = find(C == Max);
    Echelle = 1.02^Factor;
    y = ceil(j*Echelle);
    x = ceil(k*Echelle);
    Coordinates = cat(1, Coordinates, [y, x]);
    
    Image(ceil((j-13)*Echelle):ceil((j+13)*Echelle),ceil((k-13)*Echelle):ceil((k+13)*Echelle)) = -1;
end
Coordinates = Coordinates(2:4,:);
FactorF = FactorF/3;
