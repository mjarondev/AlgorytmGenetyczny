function out = Pairing2GUI(DecMatrix, pop, bits)

binMatrix = BinPopGUI(DecMatrix, bits);
[m n] = size(binMatrix);

newBinMatrix = char(zeros(pop, bits*3));
newBinMatrix(1:2, :) =  binMatrix(1:2, :);

% wyznaczenie osobnikow ktore beda braly udzial w krzyzowaniu (80%)
tempMatrix = binMatrix;
j = 0;
for k = 1:m
    if randi(100) <= 80
        j = j+1;
        tempMatrix(j, :) = binMatrix(k, :);
    end
end
tempMatrix = tempMatrix(1:j, :);


i = 3; % elitaryzm
% krzyzowanie w stalym punkcie na srodku kazdego chromosomu
% z kazdej wybranej pary powstaja dwa nowe osobniki
while i <= pop
    
    % gwarancja krzyzowania kazdego wybranego osobnika, po skrzyzowaniu
    % kazdego minimum jeden raz kolejne krzyzowania losowo
    if i <= j + 2
        k = i - 2;
    else
        k = randi(j);
    end
    l = randi(j);
    
    index = floor(0.5*bits);
    
    newBinMatrix(i, 1:index) = tempMatrix(l, 1:index);
    newBinMatrix(i, index+1:bits) = tempMatrix(k, index+1:bits);
    newBinMatrix(i, bits+1:bits+index) = tempMatrix(l, bits+1:bits+index);
    newBinMatrix(i, bits+index+1:2*bits) = tempMatrix(k, bits+index+1:2*bits);
    newBinMatrix(i, 2*bits+1:2*bits+index) = tempMatrix(l, 2*bits+1:2*bits+index);
    newBinMatrix(i, 2*bits+index+1:3*bits) = tempMatrix(k, 2*bits+index+1:3*bits);
    
    newBinMatrix(i+1, 1:index) = tempMatrix(k, 1:index);
    newBinMatrix(i+1, index+1:bits) = tempMatrix(l, index+1:bits);
    newBinMatrix(i+1, bits+1:bits+index) = tempMatrix(k, bits+1:bits+index);
    newBinMatrix(i+1, bits+index+1:2*bits) = tempMatrix(l, bits+index+1:2*bits);
    newBinMatrix(i+1, 2*bits+1:2*bits+index) = tempMatrix(k, 2*bits+1:2*bits+index);
    newBinMatrix(i+1, 2*bits+index+1:3*bits) = tempMatrix(l, 2*bits+index+1:3*bits);
    
    
    i = i+2;
end

out = DecPopGUI(newBinMatrix(1:pop, :));
end