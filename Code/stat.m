function f = stat(Z,a,b,d) % avec a c'est la ligne de la matrice et B c'est la colonne 

if d == 2 %le cas ou 12345678
 if Z(a,b,1) == 0  % bit 1
        f1 = 1;
    else
        f1 = 0;
    end
    if Z(a,b-1,1) == 0  % bit 2
        f2 = 1;
    else
        f2 = 0;
    end
    if Z(a+1,b,1) == 0 % bit3
        f3 = 1;
    else
        f3 = 0;
    end
    if Z(a+1,b-1,1) == 0    %bit4
        f4 = 1;
    else
        f4 = 0;
    end
    if Z(a+2,b,1) == 0   %bit5
        f5 = 1;
    else
        f5 = 0;
    end
    if Z(a+2,b-1,1) == 0  %bit 6 
        f6 = 1;
    else
        f6 = 0;
    end
    if Z(a+3,b,1) == 0  %bit 7
        f7 = 1;
    else
        f7 = 0;
    end
    if Z(a+3,b-1,1) == 0  %bit 8
        f8 = 1;
    else 
        f8 = 0;
    end
elseif d == 1 
     if Z(a,b,1) == 0  % bit 1
        f1 = 1;
    else
        f1 = 0;
    end
    if Z(a,b-1,1) == 0  % bit 2
        f2 = 1;
    else
        f2 = 0;
    end
    if Z(a-1,b,1) == 0 % bit3
        f3 = 1;
    else
        f3 = 0;
    end
    if Z(a-1,b-1,1) == 0    %bit4
        f4 = 1;
    else
        f4 = 0;
    end
    if Z(a-2,b,1) == 0   %bit5
        f5 = 1;
    else
        f5 = 0;
    end
    if Z(a-2,b-1,1) == 0  %bit 6 
        f6 = 1;
    else
        f6 = 0;
    end
    if Z(a-3,b,1) == 0  %bit 7
        f7 = 1;
    else
        f7 = 0;
    end
    if Z(a-3,b-1,1) == 0  %bit 8
        f8 = 1;
    else 
        f8 = 0;
    end
elseif d == 3
    
    if Z(a,b,1) == 0  % bit 1
        f1 = 1;
    else
        f1 = 0;
    end
    if Z(a,b-1,1) == 0  % bit 2
        f2 = 1;
    else
        f2 = 0;
    end
    if Z(a-1,b,1) == 0 % bit3
        f3 = 1;
    else
        f3 = 0;
    end
    if Z(a-1,b-1,1) == 0    %bit4
        f4 = 1;
    else
        f4 = 0;
    end
    if Z(a-1,b-2,1) == 0   %bit5
        f5 = 1;
    else
        f5 = 0;
    end
    if Z(a-1,b-3,1) == 0  %bit 6 
        f6 = 1;
    else
        f6 = 0;
    end
    if Z(a,b-2,1) == 0  %bit 7
        f7 = 1;
    else
        f7 = 0;
    end
    if Z(a,b-3,1) == 0  %bit 8
        f8 = 1;
    else 
        f8 = 0;
    end
elseif d == 4
    if Z(a,b,1) == 0  % bit 1
        f1 = 1;
    else
        f1 = 0;
    end
    if Z(a,b-1,1) == 0  % bit 2
        f2 = 1;
    else
        f2 = 0;
    end
    if Z(a+1,b,1) == 0 % bit3
        f3 = 1;
    else
        f3 = 0;
    end
    if Z(a+1,b-1,1) == 0    %bit4
        f4 = 1;
    else
        f4 = 0;
    end
    if Z(a+1,b-2,1) == 0   %bit5
        f5 = 1;
    else
        f5 = 0;
    end
    if Z(a+1,b-3,1) == 0  %bit 6 
        f6 = 1;
    else
        f6 = 0;
    end
    if Z(a,b-2,1) == 0  %bit 7
        f7 = 1;
    else
        f7 = 0;
    end
    if Z(a,b-3,1) == 0  %bit 8
        f8 = 1;
    else 
        f8 = 0;
    end
end
f = [f1  f2  f3  f4  f5  f6  f7  f8];
end
