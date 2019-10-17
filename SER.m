function Y = SER(x1, x2)
    l1 = length(x1);
    k = 0;
    for i = 1:l1
        if x1(i) ~= x2(i)
            k = k + 1;
        end
    end
    Y = k/l1;