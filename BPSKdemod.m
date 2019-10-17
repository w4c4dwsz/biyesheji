function Y = BPSKdemod(X,F_s,F_c,F_d)
%实现BPSK解调，输出Y为数字信号（经过判决），X输入的调制序列，F_s抽样频率，F_c载波频率，F_d数字基带码率
%********************************************
%   乘载波
    L = length(X);
    t = (0:L-1)/F_s;                    %生成时间轴
    Y1 = X .* cos(2 * pi * F_c * t);    %点乘
%********************************************
%   通过低通滤波器
%     [f_d,p_d] = T2F(X,F_s);
    [f,p] = T2F(Y1,F_s);                %傅里叶变换     
%     figure
%     subplot(131)
%     plot(f,abs(p))
    p(1:L/2-F_d*L/F_s)=0;               %模拟低通滤波器
    p(L/2+F_d*L/F_s:end)=0;
%     subplot(132)
%     plot(f,abs(p))
%     subplot(133)
%     plot(f_d,abs(p_d))
    y = F2T(f,p);                       %反变换
    y = real(y);                        %只保留实部
%********************************************    
%   一个周期内抽样
    temp = round(F_s/F_d);
%     y = [y zeros(1, temp - mod(L,temp))];
    y = y(1 : end - mod(L,temp));
    y = reshape(y,round(F_s/F_d),[]);          %每一列为一个积分周期
    y = sum(y);                         %进行积分
%********************************************
%   判决，判决门限为均值。
    y(y>=mean(y)) = 0;              
    y(y~=0) = 1;
    Y = y;
end