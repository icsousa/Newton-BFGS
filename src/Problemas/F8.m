function [f] = F8(w, a)
syms w1 w2;
%----------------------
% a é recebido como argumento (1, 10 ou 100)
fun = (w1-1)^2+(w2-1)^2+a*(w1^2+w2^2-0.25)^2;
%calcular a funcao no pto. w
f=double(subs(fun,[w1 w2],[w(1) w(2)]));
end