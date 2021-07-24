function PointsSortie = QuatriemePoint(PointsEntree)

Coordonnees = PointsEntree;

Deltax12 = Coordonnees(2, 2) - Coordonnees(1, 2);
Deltay12 = Coordonnees(2, 1) - Coordonnees(1, 1);
PointPossible1 = [Coordonnees(3, 1)-Deltay12, Coordonnees(3, 2)-Deltax12];
Longueur1 = sqrt((Coordonnees(2, 2)-PointPossible1(2))^2 + (Coordonnees(2, 1)-PointPossible1(1))^2);

Deltax13 = Coordonnees(3, 2) - Coordonnees(1, 2);
Deltay13 = Coordonnees(3, 1) - Coordonnees(1, 1);
PointPossible2 = [Coordonnees(2, 1)-Deltay13, Coordonnees(2, 2)-Deltax13];
Longueur2 = sqrt((Coordonnees(3, 2)-PointPossible2(2))^2 + (Coordonnees(3, 1)-PointPossible2(1))^2);

Deltax23 = Coordonnees(3, 2) - Coordonnees(2, 2);
Deltay23 = Coordonnees(3, 1) - Coordonnees(2, 1);
PointPossible3 = [Coordonnees(1, 1)-Deltay23, Coordonnees(1, 2)-Deltax23];
Longueur3 = sqrt((Coordonnees(3, 2)-PointPossible3(2))^2 + (Coordonnees(3, 1)-PointPossible3(1))^2);

% choix du point
Points = [PointPossible1;
          PointPossible2;
          PointPossible3];
k = find([Longueur1 Longueur2 Longueur3] == min([Longueur1 Longueur2 Longueur3]));

Point = Points(k,:);

PointsSortie = cat(1, PointsEntree, Point);

end