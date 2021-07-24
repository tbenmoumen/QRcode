function [message,c] = QRCODE(Y)
%  w = imread('fuck.bmp');
%  Y = double(im2bw(imresize(w, 1)));
X1=ones(21,21); 
% creation des masques
for a = 1:1:21
    for b = 1:1:21
        if mod((a+b),2) == 0
            X1(a,b) = 0;
        else
            X1(a,b) = 1;
        end
    end
end

X2=ones(21,21); 
 
for a = 0:1:21
    for b = 1:1:21
        if mod(a,2) == 0
            X2(a+1,b) = 0;
        end
    end
end

X3=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod(b-1,3) == 0
            X3(a,b) = 0;
        end
    end
end

X4=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod(a+b+1,3) == 0
            X4(a,b) = 0;
        end
    end
end

X5=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod(fix((a-1)/2) + fix((b-1)/3) , 2) == 0
            X5(a,b) = 0;
        end
    end
end


X6=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod((a-1)*(b-1),2) + mod((a-1)*(b-1),3) == 0
            X6(a,b) = 0;
        end
    end
end


X7=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod(mod((a-1)*(b-1),2) + mod((a-1)*(b-1),3) , 2) == 0
            X7(a,b) = 0;
        end
    end
end


X8=ones(21,21); 
for a = 1:1:21
    for b = 1:1:21
        if mod(mod((a-1)*(b-1),3) + mod((a-1)+(b-1),2) , 2) == 0
            X8(a,b) = 0;
        end
    end
end

for i=1:1:21
X1(i,7,1) = 1;
X1(7,i,1) = 1;
X2(i,7,1) = 1;
X2(7,i,1) = 1;
X3(i,7,1) = 1;
X3(7,i,1) = 1;
X4(i,7,1) = 1;
X4(7,i,1) = 1;
X5(i,7,1) = 1;
X5(7,i,1) = 1;
X6(i,7,1) = 1;
X6(7,i,1) = 1;
X7(i,7,1) = 1;
X7(7,i,1) = 1;
X8(i,7,1) = 1;
X8(7,i,1) = 1;
end

    
X1(1:9,1:9,1)=1;
X1(1:9,14:21,1)=1;
X1(14:21,1:9,1)=1;

X2(1:9,1:9,1)=1;
X2(1:9,14:21,1)=1;
X2(14:21,1:9,1)=1;

X3(1:9,1:9,1)=1;
X3(1:9,14:21,1)=1;
X3(14:21,1:9,1)=1;

X4(1:9,1:9,1)=1;
X4(1:9,14:21,1)=1;
X4(14:21,1:9,1)=1;

X5(1:9,1:9,1)=1;
X5(1:9,14:21,1)=1;
X5(14:21,1:9,1)=1;

X6(1:9,1:9,1)=1;
X6(1:9,14:21,1)=1;
X6(14:21,1:9,1)=1;

X7(1:9,1:9,1)=1;
X7(1:9,14:21,1)=1;
X7(14:21,1:9,1)=1;

X8(1:9,1:9,1)=1;
X8(1:9,14:21,1)=1;
X8(14:21,1:9,1)=1;
%% black with black = white 
% Error correction decoding 
infot = [1-Y(9,1:6,1) 1-Y(9,8,1) 1-Y(9,14:21,1)];
mask = [1 0 1 0 1 0 0 0 0 0 1 0 0 1 0];
info = double(infot);
info_unmask = zeros(1,15);
for i = 1:1:15
        if mask(i) == 0 && info(i)== 0
            info_unmask(i) = 0;
        elseif mask(i) == 1 && info(i)== 0
            info_unmask(i) = 1;
        elseif mask(i) == 0 && info(i)== 1
            info_unmask(i) = 1;
        else 
            info_unmask(i) = 0;
        end
end
e = info_unmask(3:5);

if e(1) == 0 && e(2) == 0 && e(3) == 0
    X = X1;
elseif e(1) == 0 && e(2) == 0 && e(3) == 1 
    X = X2;
elseif e(1) == 0 && e(2) == 1 && e(3) == 0 
    X = X3;
elseif e(1) == 0 && e(2) == 1 && e(3) == 1 
    X = X4;
elseif e(1) == 1 && e(2) == 0 && e(3) == 0
    X = X5; 
elseif e(1) == 1 && e(2) == 0 && e(3) == 1 
    X = X6;
elseif e(1) == 1 && e(2) == 1 && e(3) == 0 
    X = X7;
elseif e(1) == 1 && e(2) == 1 && e(3) == 1 
    X = X8;
end

Z=ones(21,21);
for i = 1:1:21
    for j = 1:1:21 
        if X(i,j,1) == 0 && Y(i,j,1)== 0
            Z(i,j,1) = 1;
        elseif X(i,j,1) == 1 && Y(i,j,1)== 0
            Z(i,j,1) = 0;
        elseif X(i,j,1) == 0 && Y(i,j,1)== 1
            Z(i,j,1) = 0;
        else 
            Z(i,j,1) = 1;
        end
    end
end

%%détermination de Enc

m =[Z(21,21,1) Z(21,20,1) Z(20,21,1) Z(20,20,1)];
if Z(21,21,1) == 1 && Z(21,20,1) == 0 && Z(20,21,1) == 1 && Z(20,20,1) == 1
    c = 4; %binary
    eci = [0 1 0 0];
elseif Z(21,21,1) == 1 && Z(21,20,1) == 1 && Z(20,21,1) == 1 && Z(20,20,1) == 0
    c = 1; %numeric
    eci = [0 0 0 1];
elseif Z(21,21,1) == 1 && Z(21,20,1) == 1 && Z(20,21,1) == 0 && Z(20,20,1) == 1
    c = 2; %alphanumeric
    eci = [0 0 1 0];
elseif Z(21,21,1) == 0 && Z(21,20,1) == 1 && Z(20,21,1) == 1 && Z(20,20,1) == 1
    c = 8; %Kanji
    eci = [1 0 0 0];
elseif Z(21,21,1) == 1 && Z(21,20,1) == 1 && Z(20,21,1) == 0 && Z(20,20,1) == 0
    c = 3; %structed append
    eci = [0 0 1 1];
elseif Z(21,21,1) == 1 && Z(21,20,1) == 0  && Z(20,21,1) == 0 && Z(20,20,1) == 0
    c = 7; %ECI
    eci = [0 1 1 1];
elseif Z(21,21,1) == 1 && Z(21,20,1) == 0  && Z(20,21,1) == 1 && Z(20,20,1) == 0
    c = 7; %FNC1 in first position	
    eci = [0 1 0 1];
elseif Z(21,21,1) == 0 && Z(21,20,1) == 1  && Z(20,21,1) == 1 && Z(20,20,1) == 0
    c = 7; %FNC1 in second position	
    eci = [1 0 0 1];
else 
    c = 0;
    eci = [0 0 0 0];
end
%c = 1;
%% determination de la longueur 
l0  = stat(Z,19,21,1);
l1 = stat(Z,15,21,1);
l2 = stat(Z,11,21,3);%%
l3 = stat(Z,12,19,2);
l4 = stat(Z,16,19,2);
l5 = stat(Z,20,19,4);
l6 = stat(Z,19,17,1);
l7 = stat(Z,15,17,1);%%
l8 = stat(Z,11,17,3);
l9 = stat(Z,12,15,2);
l10 = stat(Z,16,15,2);
l11 = stat(Z,20,15,4);
l12 = stat(Z,19,13,1);
l13 = stat(Z,15,13,1);
l14 = stat(Z,11,13,1);
l15 = stat(Z,6,13,1);
l16 = stat(Z,2,13,3);
l17 = stat(Z,3,11,3);
l18 = stat(Z,8,11,2);
l19 = stat(Z,12,11,2);
l20 = stat(Z,16,11,2);
l21 = [1-Z(20,11,1) 1-Z(20,10,1) 1-Z(21,11,1) 1-Z(21,10,1)];
l22 = stat(Z,13,9,1);
l23 = stat(Z,9,6,2);
l24 = stat(Z,13,4,1);
l25 = stat(Z,9,2,2);

L = [eci l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 l20 l21 l22 l23 l24 l25];
if c == 1 %numeric
   % p3 =L(5:5+10);
     Lenn = bin2dec(int2str(L(5:5+9))); % passer le len a un nombre
    % Lenn = 5;
     resultat1 = zeros(1,fix(Lenn/3)+1);
     if Lenn == 1
     Lennn = 1; % la longueur du bits
     else
         Lennn = 10*fix(Lenn /3);
     end
     d = 15;
    for i = 1:1:fix(Lenn/3)
      resultat1(i) = bin2dec(int2str(L(d:d+9)));
      d = d +10;
    end 
    if mod(Lenn,3) == 2
        resultat1(fix(Lenn/3)+1) = bin2dec(int2str(L(Lennn+15:Lennn+21)));
    elseif mod(Lenn,3) == 1
        resultat1(fix(Lenn/3)+1) = bin2dec(int2str(L(Lennn+15:Lennn+18)));
    else 
        resultat1 = resultat1(1,1:fix(Lenn/3));
    end 
    message =int2str(resultat1);

elseif c == 4 %binary
    len = bin2dec(int2str(l0)); % longueur
    resultat = zeros(1,len);
  %  p1 = bin2dec(int2str(l7));
    m = 13;
    for i = 1:1:len
        resultat(i) = char(bin2dec(int2str(L(m:m+7))));
        m = m + 8;
    end
    message = char(resultat);
elseif c == 2 %alphanumeric
    Lenn = bin2dec(int2str(L(5:13))); % passer le len a un nombre
    d = 14;
    resultat = zeros(1,10000);
    for i = 1:1:fix(Lenn/2)
      resultat(i) = bin2dec(int2str(L(d:d+11)));
      d = d +11;
    end 
    if mod(Lenn,2) == 1
        resultat(fix(Lenn/2)+1) = bin2dec(int2str(L(fix(Lenn/2)+11:fix(Lenn/2)+17)));
        n = fix(Lenn/2);
    else 
        resultat = resultat(1,fix(Lenn/2));
        n = fix(Lenn/2);
    end 
    resultat_final = zeros(1,n);
    for t = 1:2:n
        resultat_final(t) = fix(resultat(t)/45);
        resultat_final(t+1) = mod(resultat(t),45);
    end
    message =int2str(resultat_final);
    % apres il faut définir le tableau de alphanumeric et replacer
    % chaque valeur 
else
    message ='erreur';
    
    
% imshow(X4);
% figure, imshow(Z);
% figure, imshow (Y);
    
    
    
    
    
    
    
    
end
end
% a = char(L(1:1:Len));   
 








