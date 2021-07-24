function point = CorrectionMilieu (Imp, PointInit)

P = PointInit;

% première diagonale

PPlus = PointInit;
while((Imp(PPlus(1)+1,PPlus(2)+1) > Imp(PPlus(1),PPlus(2))) || (Imp(PPlus(1)-1,PPlus(2)-1) > Imp(PPlus(1),PPlus(2))))
    PPlus = PPlus + [1 1];
end
PMoins = PointInit;
while((Imp(PMoins(1)+1,PMoins(2)+1) > Imp(PMoins(1), PMoins(2))) || (Imp(PMoins(1)-1,PMoins(2)-1) > Imp(PMoins(1), PMoins(2))))
    PMoins = PMoins - [1 1];
end

PointInit1 = (PPlus + PMoins)/2;

% Seconde diagonale

PPlus = PointInit;
while((Imp(PPlus(1)-1,PPlus(2)+1) > Imp(PPlus(1),PPlus(2))) || (Imp(PPlus(1)+1,PPlus(2)-1) > Imp(PPlus(1),PPlus(2))))
    PPlus = PPlus + [-1 1];
end
PMoins = PointInit;
while((Imp(PMoins(1)-1,PMoins(2)+1) > Imp(PMoins(1), PMoins(2))) || (Imp(PMoins(1)+1,PMoins(2)-1) > Imp(PMoins(1), PMoins(2))))
    PMoins = PMoins - [-1 1];
end

PointInit2 = (PPlus + PMoins)/2;

% vertical

PPlus = PointInit;
while((Imp(PPlus(1)+1,PPlus(2)) > Imp(PPlus(1),PPlus(2))) || (Imp(PPlus(1)-1,PPlus(2)) > Imp(PPlus(1),PPlus(2))))
    PPlus = PPlus + [1 0];
end
PMoins = PointInit;
while((Imp(PMoins(1)+1,PMoins(2)) > Imp(PMoins(1), PMoins(2))) || (Imp(PMoins(1)-1,PMoins(2)) > Imp(PMoins(1), PMoins(2))))
    PMoins = PMoins - [1 0];
end

PointInit3 = (PPlus + PMoins)/2;

% horizontal

PPlus = PointInit;
while((Imp(PPlus(1),PPlus(2)+1) > Imp(PPlus(1),PPlus(2))) || (Imp(PPlus(1),PPlus(2)-1) > Imp(PPlus(1),PPlus(2))))
    PPlus = PPlus + [0 1];
end
PMoins = PointInit;
while((Imp(PMoins(1),PMoins(2)+1) > Imp(PMoins(1), PMoins(2))) || (Imp(PMoins(1),PMoins(2)-1) > Imp(PMoins(1), PMoins(2))))
    PMoins = PMoins - [0 1];
end

PointInit4 = (PPlus + PMoins)/2;

PointInit = round(sqrt(PointInit1.^2+PointInit2.^2+PointInit3.^2+PointInit4.^2));

if (PointInit(1) < P(1)-7 || PointInit(1) > P(1)+7 || PointInit(2) < P(2)-7 || PointInit(2) > P(2)+7)
    point = P;
else
    point = PointInit;
end

