function [f, gradf] = F2withgrad(w)
    w1 = w(1);
    w2 = w(2);

    f = 4*w1^2 + 2*w2^2 + 4*w1*w2 - 3*w1;

    df_dw1 = 8*w1 + 4*w2 - 3;
    df_dw2 = 4*w2 + 4*w1;
    
    gradf = [df_dw1; df_dw2];
end