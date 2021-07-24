function sortPoints = SortCoins(p1, p2, p3, p4)
% Points p1, p2, p3 and p4 must be lines (y x) or (j i) vectors. Returns
% clockwise P1P2P3P4 coordinates from a quadrilatere.

% Create 3 vectors from the first point P1
P1P2Vec = p2-p1;
P1P3Vec = p3-p1;
P1P4Vec = p4-p1;

% Calculate the angle they make with eachother
AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);

% Sort angles in ascending order (without signs) to then place p2 and p4 in
% the 2 vectors (P1P2Vec and P1P4Vec) forming the largest angle.
Angles = abs([AngleVec2Vec3 AngleVec3Vec4 AngleVec2Vec4]);
SortedAngles = sort(Angles);
if(Angles(1) == SortedAngles(3)) % échange de p3 et p4
    p5 = p3;
    p3 = p4;
    p4 = p5;
    P1P3Vec = p3-p1;
    P1P4Vec = p4-p1;
    %Recalculate the angles to match the changes
    AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
    AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
    AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);
elseif(Angles(2) == SortedAngles(3)) % échange de p3 et p2
    p5 = p3;
    p3 = p2;
    p2 = p5;
    P1P2Vec = p2-p1;
    P1P3Vec = p3-p1;
    AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
    AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
    AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);
end


% if there is a negative angle, invert the concerned points
while(AngleVec2Vec4>0)|(AngleVec2Vec3>0)|(AngleVec3Vec4>0)
    if AngleVec2Vec4>0
        %exchance the points
        p5 = p2;
        p2 = p4;
        p4 = p5;
        %recalculate the vectors
        P1P2Vec = p2-p1;
        P1P3Vec = p3-p1;
        P1P4Vec = p4-p1;
        %recalculate the angles. 2 points inverted => all angles changed.
        AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
        AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
        AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);
    end
    if AngleVec2Vec3>0
        p5 = p2;
        p2 = p3;
        p3 = p5;
        P1P2Vec = p2-p1;
        P1P3Vec = p3-p1;
        P1P4Vec = p4-p1;
        AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
        AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
        AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);
    end
    if AngleVec3Vec4>0
        p5 = p3;
        p3 = p4;
        p4 = p5;
        P1P2Vec = p2-p1;
        P1P3Vec = p3-p1;
        P1P4Vec = p4-p1;
        AngleVec2Vec3 = VecAngle(P1P2Vec, P1P3Vec);
        AngleVec2Vec4 = VecAngle(P1P2Vec, P1P4Vec);
        AngleVec3Vec4 = VecAngle(P1P3Vec, P1P4Vec);
    end
end

sortPoints = [p1; p2; p3; p4];