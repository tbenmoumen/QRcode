function MM2coordinates = CoordinatesOpti2(sortPoints, DestPoints, H)
% Gives the M*M matrix points calculated into the source image
% takes the sources sorted points, and the destination coordinates [x1 x2;
% y1 y2]
% takes the Homography matrix H

% X'' = HX, avec AHi = X'
% X: les coordonn�es des points de l'image source dans son rep�re
% X': les coordonn�es des points de l'image destination dans son rep�re
% X'' : les coordinn�es des points de l'image destination dans le rep�re de
% l'image source.
% H: la matrice 3*3 des Hji
% Hi: la matrice 8*1 des Hji

% % WIN = 0;
% % 
% % if WIN==0
% %     chemin='/net/e/rrodriguezm/Documents/2A/ProjetS8/images/';
% % else
% %     chemin='H:\Documents\2A\ProjetS8\images\';
% % end
% % 
% % Si = imread(strcat(chemin, 'Essai.jpg'));
% % 
% % imshow(Si);
% % X = ginput(4);
% % p1 = floor(X(1,:));
% % p2 = floor(X(2,:));
% % p3 = floor(X(3,:));
% % p4 = floor(X(4,:));
% % % % y1 = 2020;
% % % % y2 = 2788;
% % % % y3 = 3308;
% % % % y4 = 1604;
% % % % x1 = 589;
% % % % x2 = 2949;
% % % % x3 = 1357;
% % % % x4 = 2109;
% % % 
% % % y1 = X(1,2);
% % % y2 = X(2,2);
% % % y3 = X(3,2);
% % % y4 = X(4,2);
% % % x1 = X(1,1);
% % % x2 = X(2,1);
% % % x3 = X(3,1);
% % % x4 = X(4,1);
% % % p1 = [y1, x1];
% % % p2 = [y2, x2];
% % % p3 = [y3, x3];
% % % p4 = [y4, x4];
% % 
% % sortPoints = SortCoinsOpti(p1, p2, p3, p4);
% % M = SquareLength(sortPoints);

%% points utilis�s (points tri�s de l'image source)

x1 = DestPoints(1,2);
x2 = DestPoints(3,2);
y1 = DestPoints(1,1);
y2 = DestPoints(3,1);


%% Creation des vecteurs (y, x)
[X, Y] = meshgrid(x1:x2, y1:y2);
MM2coordinates = zeros((y2-y1+1), (x2-x1+1), 3);
MM2coordinates(y1:y2,x1:x2,2) = Y;
MM2coordinates(y1:y2,x1:x2,1) = X;

% X'' = MM2coordinates

% Application de H sur chaque point.

for i = x1:1:x2;
    for j = y1:1:y2
        vec = [MM2coordinates(j, i, 1); MM2coordinates(j, i, 2); 1];
        vec = H*vec;
        MM2coordinates(j, i, 1) = vec(2,1)/vec(3,1); % x
        MM2coordinates(j, i, 2) = vec(1,1)/vec(3,1); % y
    end
end

% On enlève la 3e dimension (transformation terminée)
MM2coordinates = MM2coordinates(:,:,1:2); % matrice des x' y' dans xy (dans cet ordre)
