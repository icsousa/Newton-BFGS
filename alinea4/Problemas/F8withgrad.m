function [f, gradf] = F8withgrad(w, alpha)
    w1 = w(1);
    w2 = w(2);

    f = (w1 - 1)^2 + (w2 - 1)^2 + alpha * (w1^2 + w2^2 - 0.25)^2;

    df_dw1 = 2*(w1 - 1) + 4 * alpha * w1 * (w1^2 + w2^2 - 0.25);
    df_dw2 = 2*(w2 - 1) + 4 * alpha * w2 * (w1^2 + w2^2 - 0.25);
    
    gradf = [df_dw1; df_dw2];
end