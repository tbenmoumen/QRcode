clc
clear all
close all

%% Merci de mettre les images à tester dans le répertoire 'Images' à côté du répertoire 'Rendu'
path = num2str(pwd);
if computer() == 'GLNXA64'
    chemin=strcat(path(1:length(path)-5),'images/');
else
    chemin=strcat(path(1:length(path)-5),'images\');
end

%% Ouverture de l'image

Si = imread(strcat(chemin, 'TECHNO-QR-.jpg')); %% Mettez ici le nom de l'image à analyser
SiR = Si(:,:,1);
SiV = Si(:,:,2);
SiB = Si(:,:,3);

Yl = 0.299*SiR+0.587*SiV+0.114*SiB;

%% 1ere etape: detection des coins
[p1, p2, p3, p4] = QuatreCoordonnees(Yl);
%% 2e etape: redressement
Droit = Transform2(Yl, p1, p2, p3, p4);
%% 3e etape: generation du QR code
QR = QRDetection(Droit);

%%

if not(QR == -1)
    figure,
    imshow(QR);
else
    %%
    figure(),
    imshow(uint8(Si));
    title(sprintf('La detection des ancres a échoue.\nSelectionnez les 4 coins du QR code\naussi précisément que possible.'));
    X = ginput(4);
    close;
    p1 = floor(X(1,:));
    p2 = floor(X(2,:));
    p3 = floor(X(3,:));
    p4 = floor(X(4,:));
    Droit = Transform2(Yl, p1, p2, p3, p4);
    QR = QRDetection(Droit);
    figure,
    imshow(QR);
end
%% Dechiffrage du message (21*21 seulement)

if QR == -1
    message = 'erreur: QR code non détecté';
else
    [message,c] = QRCODE(QR);
end
message