function out = RankSelectionGUI(DecMatrix, model, sens)
% DecMatrix - macierz populacji(dziesietna)
% sens - jaki procent najlepszych bedzie wybrany
% model - nastawy danego obiektu

% wyznacza nastawy metoda rangowa

sens = sens*0.01;

[m, n] = size(DecMatrix);
score = zeros(m, 2);


% obliczenie funkcji celu dla populacji
for i = 1:m
    temp = PIDOptimFuncGUI(DecMatrix(i, :), model);
    score(i, :) = [temp(1), i];
end

% sortowanie populacji
[sortedScore, sortedIndices] = sort(score(:, 1));

% wybranie minimum dwoch najlepszych osobnikow
procent = round(sens*m);
if procent > m
    procent = m;
elseif procent < 2
    procent = 2;
end

% wybranie % najlepszych osobnikow
out = DecMatrix(sortedIndices(1:procent), :);

    
end