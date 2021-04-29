function out = MutationGUI(DecMatrix, bits)


[m, n] = size(DecMatrix);
binMatrix = BinPopGUI(DecMatrix, bits);
% elitaryzm, brak mutacji 2 najlepszych osobnikow
for i = 3:m 
    
    % wyznaczenie ktory osobnik ulegnie mutacji (4%)
    mut = randi(100, [1, 3*bits]) < 4;
    
    for j = 1:3*bits
        if mut(j) == 1
            % wyznaczenie jaka wartosc ma miec zmutowany bit
            binMatrix(i, j) = string(randi(2)-1);
        end
    end
    
end

out = DecPopGUI(binMatrix);

end