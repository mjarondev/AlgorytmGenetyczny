function out = StartPopGUI(population, bits)
% tworzy populacje poczatkowa
% population - ilosc osobnikow
% bits - ilosc na nastawe osobnika (osobnik ma 3*bits bitow, poniewaz ma 3
% nastawy P, I oraz D)
range = 2.^(bits-1);

% sposob kodowania - liczby calkowite przeksztalcone na binarne,
% zmiennoprzecinkowosc do 2 miejsca po przecinku zapewniona przez 
% podzielenie liczby calkowitej przez 100, przed zmiana na
% bity liczba calkowita mnozona razy 100
P = randi(range, [population, 1]);
I = randi(range, [population, 1]);
D = randi(range, [population, 1]);

out = [dec2bin(P, bits), dec2bin(I, bits), dec2bin(D, bits)];

end