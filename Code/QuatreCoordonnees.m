function [P1, P2, P3, P4] = QuatreCoordonnees(Image)

%% Détection du centre des ancres
[Coordonnees, Factor] = Trouver3Coordonnees(double(Image));

G=fspecial('gaussian',23,2);

Gp = conv2(G, [-1 0 1], 'same');

Xp = conv2(Image, Gp, 'same');
Yp = conv2(Image, Gp', 'same');
Imp = sqrt(Yp.^2 + Xp.^2);

Points = QuatriemePoint(Coordonnees);

p1 = [Points(1,1) Points(1,2)];
p2 = [Points(2,1) Points(2,2)];
p3 = [Points(3,1) Points(3,2)];

figure(),
imshow(uint8(Image));
title('Merci de bien vouloir selectionner le coin o� l ancre est absente');
X = ginput(1);
close;
p4 = floor(X(1,:)); % forcément le bon point puisque demandé
p4 = fliplr(p4);

%% tri des points
sortedPoints = SortCoinsOpti(p4, p1, p2, p3); % mettre p4 en premier permet de trier les autres à partir de celui-là, donc p4 ne change pas de place (utile pour la suite)

p4 = [sortedPoints(1,1) sortedPoints(1,2)];
p1 = [sortedPoints(2,1) sortedPoints(2,2)];
p2 = [sortedPoints(3,1) sortedPoints(3,2)];
p3 = [sortedPoints(4,1) sortedPoints(4,2)];

%% pour les points 1 à 3, manipulation des dérivées pour bien placer les points au milieu (d�tection imparfaite)

p1 = CorrectionMilieu(Imp, p1);
p2 = CorrectionMilieu(Imp, p2);
p3 = CorrectionMilieu(Imp, p3);


% point 2: le point à l'opposé du point 4
Vec = p2 - p4;
taille = TailleVec(Image, p4, p2);
p2 = floor(taille*Vec./Longueur(p2, p4))+p2;

Vec = p1 - p3;
taille = TailleVec(Image, p3, p1);
p1 = ceil(taille*0.8*Vec./Longueur(p1, p3))+p1;

Vec = p3 - p1;
taille = TailleVec(Image, p1, p3);
p3 = ceil(taille*Vec./Longueur(p3, p1))+p3;

P1 = fliplr(p2);
P2 = fliplr(p3);
P3 = fliplr(p4);
P4 = fliplr(p1);

end