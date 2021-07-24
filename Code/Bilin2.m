function SquareImage = Bilin2(DestPoints, MM2coordinates, SourceImage)
% This function returns a square image with the bilinear method, from the  
% size of the destination image, the map
% of coordinates MM2coordinates into the source image, and the source
% image. The image can be a RGB one, or an indexed one.
    x1 = DestPoints(1,2);
    x2 = DestPoints(3,2);
    y1 = DestPoints(1,1);
    y2 = DestPoints(3,1);

    S = MM2coordinates;
    Si = SourceImage;
    Size = size(SourceImage);
    taille = size(Size);

    if taille(2) == 3 % if RGB

        Sf = zeros(y2,x2,3);
        for c = [1, 2, 3]
            for i = x1:1:x2
                for j = y1:1:y2
                    y=floor(S(j,i,2));
                    x=floor(S(j,i,1));
                    if((x>0 & x+1>0 & x<Size(2) & x+1<Size(2)) & (y>0 & y+1>0 & y<Size(1) & y+1<Size(1)))
                        b = (S(j,i,2)- floor(S(j,i,2))); % y'-y
                        a = (S(j,i,1)- floor(S(j,i,1))); % x'-x
                        Sf(i,j,c) = b*(1-a)*Si(y+1,x,c) + b*a*Si(y+1,x+1,c) + (1-b)*(1-a)*Si(y,x,c) + a*(1-b)*Si(y,x+1,c);
                    end
                end
            end
        end

    else %if indexed colors

        Sf = zeros(y2,x2);
        for i = x1:1:x2
            for j = y1:1:y2
                y=floor(S(j,i,2));
                x=floor(S(j,i,1));
                if((x>0 & x+1>0 & x<Size(2) & x+1<Size(2)) & (y>0 & y+1>0 & y<Size(1) & y+1<Size(1)))
                    a = (S(j,i,1)- floor(S(j,i,1))); % y'-y
                    b = (S(j,i,2)- floor(S(j,i,2))); % x'-x
                    Sf(i,j) = b*(1-a)*Si(y+1,x) + b*a*Si(y+1,x+1) + (1-b)*(1-a)*Si(y,x) + a*(1-b)*Si(y,x+1);
                end
            end
        end

    end
SquareImage = Sf;
