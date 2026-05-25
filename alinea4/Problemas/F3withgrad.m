function [f, gradf] = F3withgrad(w)
    w1 = w(1);
    w2 = w(2);

    f = w1^2 + 2*w2^2 - 2*w1*w2 - 2*w2;

    df_dw1 = 2*w1 - 2*w2;
    df_dw2 = 4*w2 - 2*w1 - 2;
        
    gradf = [df_dw1; df_dw2];
end