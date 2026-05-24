function [f, gradf] = F1withgrad(w)
    w1 = w(1);
    w2 = w(2);

    f = 100 * (w2 - w1^2)^2 + (1 - w1)^2;

    df_dw1 = -400 * w1 * (w2 - w1^2) - 2 * (1 - w1);
    df_dw2 = 200 * (w2 - w1^2);
    
    gradf = [df_dw1; df_dw2];
end