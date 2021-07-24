function H = homographyEstimate2(SourcePoints, DestPoints)
% Prend deux matrice de 4 points en colonne, tri�s P1P2P3P4

y1 = SourcePoints(1, 1);
y2 = SourcePoints(2, 1);
y3 = SourcePoints(3, 1);
y4 = SourcePoints(4, 1);
x1 = SourcePoints(1, 2);
x2 = SourcePoints(2, 2);
x3 = SourcePoints(3, 2);
x4 = SourcePoints(4, 2);

yp1 = DestPoints(1,1);
yp2 = DestPoints(2,1);
yp3 = DestPoints(3,1);
yp4 = DestPoints(4,1);
xp1 = DestPoints(1,2);
xp2 = DestPoints(2,2);
xp3 = DestPoints(3,2);
xp4 = DestPoints(4,2);


A = [x1 y1 1  0  0  0 -x1*xp1 -y1*xp1;
     x2 y2 1  0  0  0 -x2*xp2 -y2*xp2;
     x3 y3 1  0  0  0 -x3*xp3 -y3*xp3;
     x4 y4 1  0  0  0 -x4*xp4 -y4*xp4;
     0  0  0  x1 y1 1 -x1*yp1 -y1*yp1;
     0  0  0  x2 y2 1 -x2*yp2 -y2*yp2;
     0  0  0  x3 y3 1 -x3*yp3 -y3*yp3;
     0  0  0  x4 y4 1 -x4*yp4 -y4*yp4];
Xp = [xp1; xp2; xp3; xp4; yp1; yp2; yp3; yp4];
Hi = pinv(A)*Xp; % A*Hi = Xp => Hi = pinv(A)*Xp

H = [Hi(1) Hi(2) Hi(3);
     Hi(4) Hi(5) Hi(6);
     Hi(7) Hi(8)  1  ];
H = pinv(H);

