function [out, p, cr, u, kc] = PIDOptimFuncGUI(PID, model)
% PID - nastawy PID
% model - nastawy danego obiektu


% przypisanie wartości PID
P = PID(1);
I = PID(2);
D = PID(3);

% przypisanie wartości modelu w simulinku
k = model(1);
T1 = model(2);
T2 = model(3);
tau = model(4);
simTime = model(5);

%1.symulacja układu regulacji w zadanym stałym czasie
options = simset('SrcWorkspace', 'current');
simOut = sim('modeleSIGUI', simTime, options);

%2.wyznaczenie parametrów uwzględnionych w optymalizacji
delta = 5; %podane w %
przeregulowanie = abs(((max(simOut.y)-simOut.y(end))/simOut.y(end))*100); %podane w %
uchyb = abs(simOut.y(end) - simOut.u(end));
for i = length(simOut.t) : -1 : 1
    if simOut.y(i) > (1+delta/100)*simOut.u(end) || simOut.y(i) < (1-delta/100)*simOut.u(end)
       czasRegulacji = simOut.t(i);
       break; 
    end
end
kryteriumCalkowe = trapz(simOut.t, simOut.e.^2); % calka kwadratu bledu
%3.wyliczenie funkcji kosztu - minimalizacja!
%np.
%na out wpisac wagi i kryteria np
%0.5*przeregulowanie + 0.1*czas regulacji + 0.2*uchyb + 0.2*kryterium
%całkowe kwadratu błędu
p = przeregulowanie;
cr = czasRegulacji;
u = uchyb;
kc = kryteriumCalkowe;
out = 0.5*p+0.1*cr+0.2*u+0.2*kc;
%im blizej 0 tym lepsze

end

