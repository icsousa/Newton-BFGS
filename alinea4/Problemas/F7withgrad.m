function [f, gradf] = F7withgrad(w)
    w1 = w(1);
    w2 = w(2);
    w3 = w(3);

    f = w1^2 + w2^2 + w3^2;

    df_dw1 = 2*w1;
    df_dw2 = 2*w2;
    df_dw3 = 2*w3;
    
    gradf = [df_dw1; df_dw2; df_dw3];
end