function taille = TailleVec(Image, PD, PF)

% PF: point où se trouve l'ancre autour de laquelle on travaille
c = zeros(1,1000);
i = 0;
MAX = 0;
trouve = 1000;
ipas = 10;
while( i < 1000 || trouve > MAX/3 || i < 5*ipas)
    p = 1.01^i;
    L = Longueur(PD,PF);
    x = [-ceil(L*0.4):ceil(L*0.4)]*p;
    x = ceil(x);
    y = x;
    while (x(1) < -PF(2)+1)
        x = x(2:size(x,2)-1);
        y = y(2:size(y,2)-1);
    end
    while (y(1) < -PF(1)+1)
        x = x(2:size(x,2)-1);
        y = y(2:size(y,2)-1);
    end
    while (x(size(x,2)) > size(Image,2)-PF(2))
        x = x(2:size(x,2)-1);
        y = y(2:size(y,2)-1);
    end
    while (y(size(y,2)) > size(Image, 1)-PF(1))
        x = x(2:size(x,2)-1);
        y = y(2:size(y,2)-1);
    end
    
    x = x+PF(2);
    y = y+PF(1);
    
    
    v = x;
    for j = 1:size(x,2)
        v(j) = Image(y(j), x(j));
    end
    u = conv2(v, [1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 1 1], 'same');
    if mod(size(u,2),2) == 0
        trouve = max(u(ceil(size(u,2)/2)), u(ceil(size(u,2)/2)));
    else
        trouve = u(ceil(size(u,2)/2));
    end
        
    if (trouve > MAX)
        MAX = trouve;
        ipas = i;
    end
    c(i+1) = trouve;
    i = i+1;
end

Max = max(max(c));
i = find(c > 0.9*Max);
k = floor(length(i)/2)+1;
i = i(k);
taille = 3*4.7*((1.01)^i);



end