function [w_opt,Fval_opt,output]=BFGS_Armijo(F,Fwithgrad,H0,w0,epsilon,Kmax)
%
k=0;  %contador de iterações
wk=w0;
Hk=H0;
[Fk,gradk]=Fwithgrad(wk);
output=[];
etak=0;
while (k <= Kmax)
    norma=norm(gradk,inf);
    if (norma <= epsilon)
        output=[output; k wk' Fk gradk' etak norma];
        break;
    end
    %direção de BFGS: pk=-Hk*gradk
    pk=-Hk*gradk;
    %% calcular eta com procura de Armijo com backtracking
    etak= ArmijoBacktracking(F,Fk,gradk,wk,pk);
   
    %% para guardar informação
    output=[output;k wk' Fk gradk' etak norma];
    %% novo ponto w_k+1
    wt=wk;
    gradt=gradk;
    wk=wt+etak*pk;
    %% Atualização de Hk por BFGS
    %calcular F e grad no novo ponto wk
    [Fk,gradk]=Fwithgrad(wk);
    sk=wk-wt;
    yk=gradk-gradt;

    %% Damped BFGS Update (Secção 18.3, Nocedal & Wright)
    Bk_sk=Hk\sk;  % Bk*sk, onde Bk=inv(Hk)
    sTy=sk'*yk;
    sTBs=sk'*Bk_sk;
    if (sTy >= 0.2*sTBs)
        theta=1;
    else
        theta=(0.8*sTBs)/(sTBs-sTy);
    end
    rk=theta*yk+(1-theta)*Bk_sk;
    %% atualização BFGS com rk em vez de yk
    rho=1/(sk'*rk);
    n=length(wk);
    I=eye(n);
    Hk=(I-rho*sk*rk')*Hk*(I-rho*rk*sk')+rho*(sk*sk');

    k=k+1;
end
w_opt=wk;
Fval_opt=Fk;
end
