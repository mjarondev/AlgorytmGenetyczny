function out = RandomSelectionGUI(DecMatrix, model, sens)
% DecMatrix - macierz populacji(dziesietna)
% model - nastawy danego obiektu
% sens - im wieksza wartosc sens tym wieksze rozbieznosci miedzy
% wartosciami poszczegolnych osobnikow na kole, dla wyzszych wartosci sens
% lepsze osobniki zajmuja wiecej procent powierzchni kola ruletki,
% zwiekszenie sens zwieksza szanse wylosowania najlepszych osobnikow oraz
% zmniejsza szanse wylosowania najgorszych osobnikow, zmniejszenie sens
% wyplaszcza szanse osobnikow na bycie wybranym, sens = 0 sprawia ze
% wszyscy maja taka sama szanse
% wyznacza nastawy metoda kola ruletki


[m, n] = size(DecMatrix);
score = zeros(m, 2);

% obliczenie funkcji celu dla populacji
for i = 1:m
    temp = PIDOptimFuncGUI(DecMatrix(i, :), model);
    score(i, :) = [temp(1), i];
end
scoreSum = sum(score(:, 1));
% wyznaczenie danych do kola ruletki
part = [score(:, 1)/scoreSum, score(:, 2)];
% odwrocenie danych kola ruletki(ze wzgledu na to ze najlepszy wynik dla nas
% wynosi 0)
partReverse = [1./(ones(m, 1)+part(:, 1).*sens), part(:, 2)];
% wyznaczenie sekcji w kole ruletki
sections = [cumsum(partReverse(:, 1)), partReverse(:, 2)];

wheelMax = sections(end, 1);


e = zeros(m, 1);

% elitaryzm
[sortedScore, sortedIndices] = sort(score(:, 1));
e(1) = sortedIndices(1);
e(2) = sortedIndices(2);
% losowanie
for i = 3:m % m-2 losów na kole
    wheelTicket = rand(1) * wheelMax;
    for j = 1:m % m przedziałów
       if wheelTicket <= sections(j, 1)
           e(i) = sections(j, 2);
           break;
       end
    end
end

out = DecMatrix(e, :);

end