function [f, gradf] = F5withgrad(w)
    w1 = w(1);
    w2 = w(2);
    w3 = w(3);

    f = 0.5*(2*w1^2 + 3*w2^2 + 4*w3^2) + 8*w1 + 9*w2 + 8*w3;

    df_dw1 = 2*w1 + 8;
    df_dw2 = 3*w2 + 9;
    df_dw3 = 4*w3 + 8;
    
    gradf = [df_dw1; df_dw2; df_dw3];
end