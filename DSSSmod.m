function [t, Y] = DSSSmod(X,F_X,C, F_c, F_s)
%[t, Y] = DSSSmod(X,F_X,C, F_c, F_s) GPSϵͳ����
    temp = ds_mod(C, X);
    fd = F_X * length(C);
    [t, Y] = newBPSKmod(temp,fd,F_c,F_s);
end

    