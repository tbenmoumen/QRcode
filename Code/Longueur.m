function Length = Longueur(p1, p2)

    p1x = p1(1);
    p2x = p2(1);
    p1y = p1(2);
    p2y = p2(2);
    
    Length = sqrt((p1x-p2x)^2 + (p1y-p2y)^2);
end