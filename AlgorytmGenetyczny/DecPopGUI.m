function out = DecPopGUI(binMatrix)
% przeksztalca macierz binarna na bity dziesietna (w formacie zmiennoprzecinkowym) 
[m n] = size(binMatrix);

P = bin2dec(binMatrix(:, 1:n/3))/100;
I = bin2dec(binMatrix(:, n/3+1:2*n/3))/100;
D = bin2dec(binMatrix(:, 2*n/3+1:n))/100;


out = [P I D];

end