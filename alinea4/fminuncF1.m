clear, clc, close all;

addpath('Problemas');
options = optimoptions('fminunc','Algorithm', 'quasi-newton','Display','iter','SpecifyObjectiveGradient',true);

%% Problema 1
fprintf('\n PROBLEMA 1 \n');
w0 = [-1.2;1];

[wopt,Fopt,exitflag,output] = fminunc(@F1withgrad,w0,options)

%% Problema 2
fprintf('\n PROBLEMA 2 \n');
w0 = [2; 2]; 
[wopt2, Fopt2, exitflag2, output2] = fminunc(@F2withgrad, w0, options)

%% Problema 3
fprintf('\n PROBLEMA 3 \n');
w0 = [0; 0]; 
[wopt3, Fopt3, exitflag3, output3] = fminunc(@F3withgrad, w0, options)

%% Problema 4
fprintf('\n PROBLEMA 4 \n');
w0 = [2; -2]; 
[wopt4, Fopt4, exitflag4, output4] = fminunc(@F4withgrad, w0, options)

%% Problema 5
fprintf('\n PROBLEMA 5 \n');
w0 = [0; 0; 0]; 
[wopt5, Fopt5, exitflag5, output5] = fminunc(@F5withgrad, w0, options)

%% Problema 6
fprintf('\n PROBLEMA 6 \n');
w0 = [0; 0; 0];
[wopt6, Fopt6, exitflag6, output6] = fminunc(@F6withgrad, w0, options)

%% Problema 7
fprintf('\n PROBLEMA 7 \n');
w0 = [1; 1; 1]; 
[wopt7, Fopt7, exitflag7, output7] = fminunc(@F7withgrad, w0, options)

%% Problema 8
fprintf('\n PROBLEMA 8 \n');
w0 = [1; -1];
alphas = [1, 10, 100]; %

for i = 1:length(alphas)
    alpha_atual = alphas(i);
    fprintf('\n A resolver P8 para alpha = %d \n', alpha_atual);

    fun = @(w) F8withgrad(w, alpha_atual); 
    
    [wopt8, Fopt8, exitflag8, output8] = fminunc(fun, w0, options);
    
    fprintf('wopt para alpha=%d:\n', alpha_atual);
    disp(wopt8);
end
