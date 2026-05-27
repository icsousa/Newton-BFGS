clear, clc, close all;

addpath('Problemas');

options = optimoptions('fminunc', 'Algorithm', 'quasi-newton', 'Display', 'iter', 'SpecifyObjectiveGradient', true);

epsilon = 1e-6;
Kmax = 1000;

%% Problema 1

fprintf('\n Problema 1\n');
w0 = [-1.2; 1];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F1withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F1, @F1withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 2

fprintf('\n Problema 2\n');
w0 = [2; 2];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F2withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F2, @F2withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 3

fprintf('\n Problema 3\n');
w0 = [0; 0];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F3withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F3, @F3withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 4

fprintf('\n Problema 4\n');
w0 = [2; -2];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F4withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F4, @F4withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 5

fprintf('\n Problema 5\n');
w0 = [0; 0; 0];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F5withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F5, @F5withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 6

fprintf('\n Problema 6\n');
w0 = [0; 0; 0];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F6withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F6, @F6withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 7

fprintf('\n Problema 7\n');
w0 = [1; 1; 1];

fprintf('\n A resolver com fminunc \n');
[wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(@F7withgrad, w0, options)

fprintf('\n A resolver com BFGS \n');
H0 = eye(length(w0));
[wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(@F7, @F7withgrad, H0, w0, epsilon, Kmax)

fprintf('\nResultados Finais:\n');
fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);

%% Problema 8

fprintf('\n Problema 8\n');
w0 = [1; -1];
alphas = [1, 10, 100];

for i = 1:length(alphas)
    alpha_atual = alphas(i);

    fprintf('\n alpha = %d \n', alpha_atual);
    fun_grad = @(w) F8withgrad(w, alpha_atual);
    fun_val  = @(w) F8(w, alpha_atual);

    fprintf('\n A resolver com fminunc \n');
    [wopt_fmin, Fopt_fmin, exitflag, output_fmin] = fminunc(fun_grad, w0, options)

    fprintf('\n A resolver com BFGS \n');
    H0 = eye(length(w0));
    [wopt_bfgs, Fopt_bfgs, output_bfgs] = BFGS(fun_val, fun_grad, H0, w0, epsilon, Kmax)

    fprintf('\nResultados Finais:\n');
    fprintf('fminunc MATLAB: Fopt = %.6f | Iterações = %d\n', Fopt_fmin, output_fmin.iterations);
    fprintf('BFGS: Fopt = %.6f | Iterações = %d\n', Fopt_bfgs, size(output_bfgs, 1) - 1);
end