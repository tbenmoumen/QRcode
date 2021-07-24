function milieu = milieu(Values)

    Integrale = zeros(1, length(Values));
    Integrale(1) = Values(1); % On effectue l'intégrale
    for i = 2:length(Values)
        Integrale(i) = Integrale(i-1) + Values(i);
    end

    MilieuValeur = max(Integrale)/2;

    milieu = 1;
    while(Integrale(milieu)<MilieuValeur)
        milieu = milieu+1;
    end