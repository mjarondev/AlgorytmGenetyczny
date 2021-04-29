function out = BinPopGUI(decMatrix, bits)
% przeksztalca macierz dziesietna(w formacie zmiennoprzecinkowym) na bity
P = dec2bin(int32(decMatrix(:, 1)*100), bits);
I = dec2bin(int32(decMatrix(:, 2)*100), bits);
D = dec2bin(int32(decMatrix(:, 3)*100), bits);

out = [P I D];
end