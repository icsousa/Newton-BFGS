function [f, gradf] = F4withgrad(w)
    w1 = w(1);
    w2 = w(2);

    f = (w1 + w2)^4 + w2^2;

    df_dw1 = 4*(w1 + w2)^3;
    df_dw2 = 4*(w1 + w2)^3 + 2*w2;
    
    gradf = [df_dw1; df_dw2];
end