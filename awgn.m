function y = awgn(x,var)
% 添加均值为0，方差为v的高斯白噪声到输入的信号上（方差 = 信号平均功率）
%*************************************************************************************
%         x   ---> input signal
%         var ---> variance
%         y   ---> y = x + AWGN    
%***********************************************************************************
%     fs = 10000;
%     fmax = fs/2;
%     wpass = 1500;
%     wstop = 1800;
%     Wp = wpass/fmax;
%     Ws = wstop/fmax;
%     [n,Wn] = buttord(Wp,Ws,3,60);
%     [b,a] = butter(n,Wn);
    w = randn(1,length(x));
	w = w - mean(w)*ones(size(w));  %生成零均值随机序列
    w = sqrt(var)*(w / std(w));     %生成符合方差要求的序列
%     w = filter(b,a,w);
    x = x(:);                       %将信号变形为一位列向量，增强鲁棒性
    w = w(:); 
    y = (x + w)';                      %输入序列与高斯白噪声
end

