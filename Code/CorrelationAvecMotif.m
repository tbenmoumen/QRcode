function ImageSortie = CorrelationAvecMotif(ImageEntree, parametre)



r=27; % taille de la matrice Y
Y=[1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1];
Y=Y-mean(Y);
Yn=sqrt(sum(Y.*Y));
G=fspecial('gaussian',17,1.5);
Yl=conv2(ImageEntree,G,'same'); % passe-bas

Xmem=imresize(Yl,1/parametre,'bilinear'); % resize avec parametre

X=Xmem;
X=X-conv2(X,ones(1,r)/r,'same');
Xn=(conv2(X.*X,ones(1,r),'same')).^0.5;
Cx=conv2(X,Y,'same')./Xn/Yn;

X=Xmem';
X=X-conv2(X,ones(1,r)/r,'same');
Xn=(conv2(X.*X,ones(1,r),'same')).^0.5;
Cy=(conv2(X,Y,'same')./Xn/Yn)';

ImageSortie = min(Cx.*abs(Cy), abs(Cx).*Cy);

end
