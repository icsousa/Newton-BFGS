function [etak] = ArmijoBacktracking(Fun, Fk, gradk, wk, sk)
    % Parâmetros da procura de Armijo
    c = 1e-4; % Condição de decréscimo suficiente (c1)
    rho = 0.5; % Fator de contração do passo (beta)
    
    % Inicialização do comprimento de passo
    eta = 1;  
    
    % Avaliação da função no ponto candidato inicial
    waux = wk + eta * sk;
    Faux = Fun(waux);
    
    % Ciclo de Backtracking: verifica a condição de Armijo
    while (Faux > Fk + c * eta * (gradk' * sk))
        eta = rho * eta; % Reduz o passo
        waux = wk + eta * sk; % Atualiza o ponto candidato
        Faux = Fun(waux); % Avalia a função no novo ponto
    end
    
    % Retorna o comprimento de passo aceite
    etak = eta;
end