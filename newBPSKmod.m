function [t , Y] = newBPSKmod (X, F_X,F_c,F_s)
    L = length(X);
    ts = 1 / F_s;
    tx = 1 / F_X;
    time = 0;
    temp = [];
    while(time <= L * tx)
        temp = [ temp  X(fix(time/tx) + 1)];
        time = time + ts;
    end
    t = (0 : length(temp)-1) * ts;
    Y = (2 * temp - 1) .* cos( 2 * pi * F_c * t);
%     plot(t,Y)
%     axis ( [0,inf,-1.2,1.2])
end
