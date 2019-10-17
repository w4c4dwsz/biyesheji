function Y = DSSSdemod(X,C,F_s,F_c,F_d)
% Y = DSSSdemod(X,C,F_s,F_c,F_d) GPS系统解调制
    fd = F_d * length(C);
    temp = BPSKdemod(X,F_s,F_c,fd);
    Y = ds_demod(C,temp);
    Y(Y>0) = 1;
end