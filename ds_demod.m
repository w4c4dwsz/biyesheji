function x = ds_demod(c,y)
%DSSS序列解扩,输出为行。 ds_demod(伪随机序列_行，直接扩频序列_行) [没有进行判决]
%*************************************************************************************
%			 c ---> user code (column vector)
%         y ---> tmp = c*x, y = tmp(:) (ds-ss modulated signal, column vector)
%         x ---> input signal (row vector)
%***********************************************************************************
%     c = c';
%     y = y';
%     tmp = reshape(y, length(c), length(y)/length(c));   %修改信号的矩阵形式以便于进行调制运算
%     tmp = tmp';                                         %
% %实现两个任务。扩频序列与扩频码相乘以及在一个码元周期内做积分~
%     x = tmp * c;                                        %解调制，x为列向量。
%     x = x';                                             % x化为行向量
%     m = mean(x);
%     for i = 1:length(x)
%         if x(i) > m
%             x(i) = 1;
%         else
%             x(i) = 0;
%         end
%     end
%***********************************************************************
    lc = length(c);
    ly = length(y);
    cc = repmat(c,1,ly/lc);
    x_temp = xor(cc,y);
    x_temp = reshape(x_temp,lc,ly/lc);
    x_temp = sum(x_temp);
    x = x_temp;
    m = mean(x);
    for i = 1:length(x)
        if x(i) > m
            x(i) = 1;
        else
            x(i) = 0;
        end
end

