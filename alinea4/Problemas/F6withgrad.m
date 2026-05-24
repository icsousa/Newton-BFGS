function [f, gradf] = F6withgrad(w)
    w1 = w(1);
    w2 = w(2);
    w3 = w(3);

    f = 0.5*(5*w1^2 + 7*w2^2 + 9*w3^2 + 4*w1*w2 + 2*w1*w3 + 6*w2*w3) + 9*w1 + 8*w3;

    df_dw1 = 5*w1 + 2*w2 + w3 + 9;
    df_dw2 = 7*w2 + 2*w1 + 3*w3;
    df_dw3 = 9*w3 + w1 + 3*w2 + 8;
    
    gradf = [df_dw1; df_dw2; df_dw3];
end