function [w_opt, Fval_opt, output] = BFGS(F, Fwithgrad, H0, w0, epsilon, Kmax)
    % Inicialização de variáveis
    k = 0; % Contador de iterações
    wk = w0; % Ponto inicial
    Hk = H0; % Aproximação inicial da inversa da Hessiana
    
    [Fk, gradk] = Fwithgrad(wk);
    output = [];
    etak = 0; % Passo inicial
    
    % Ciclo iterativo do método BFGS
    while (k <= Kmax)
        norma = norm(gradk, inf);
        
        % Critério de paragem: norma do infinito do gradiente <= epsilon
        if (norma <= epsilon)
            output = [output; k, wk', Fk, gradk', etak, norma];
            break;
        end
        
        % Calcular a direção de descida (BFGS): pk = -Hk * gradk
        pk = -Hk * gradk;
        
        % Calcular o comprimento de passo (eta) com procura de Armijo
        etak = ArmijoBacktracking(F, Fk, gradk, wk, pk);
       
        % Guardar a informação da iteração atual para a tabela de resultados
        output = [output; k, wk', Fk, gradk', etak, norma];
        
        % Atualizar o ponto de iteração (w_k+1)
        wt = wk;
        gradt = gradk;
        wk = wt + etak * pk;
        
        % Avaliar a função e o gradiente no novo ponto wk
        [Fk, gradk] = Fwithgrad(wk);
        
        % Vetores de variação de posição (sk) e de gradiente (yk)
        sk = wk - wt;
        yk = gradk - gradt;
    
        % Damped BFGS Update (Secção 18.3, Nocedal & Wright)
        Bk_sk = Hk \ sk; % Bk * sk, onde Bk = inv(Hk)
        sTy = sk' * yk;
        sTBs = sk' * Bk_sk;
        
        % Cálculo do parâmetro de amortecimento (theta)
        if (sTy >= 0.2 * sTBs)
            theta = 1;
        else
            theta = (0.8 * sTBs) / (sTBs - sTy);
        end
        
        % Vetor yk modificado (amortecido)
        rk = theta * yk + (1 - theta) * Bk_sk;
        
        % Atualização da aproximação da Hessiana inversa (Hk) com rk
        rho = 1 / (sk' * rk);
        n = length(wk);
        I = eye(n);
        
        Hk = (I - rho * sk * rk') * Hk * (I - rho * rk * sk') + rho * (sk * sk');
    
        % Incrementar contador de iterações
        k = k + 1;
    end
    
    % Resultados finais
    w_opt = wk;
    Fval_opt = Fk;
end