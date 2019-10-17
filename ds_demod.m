function x = ds_demod(c,y)
%DSSS���н���,���Ϊ�С� ds_demod(α�������_�У�ֱ����Ƶ����_��) [û�н����о�]
%*************************************************************************************
%			 c ---> user code (column vector)
%         y ---> tmp = c*x, y = tmp(:) (ds-ss modulated signal, column vector)
%         x ---> input signal (row vector)
%***********************************************************************************
%     c = c';
%     y = y';
%     tmp = reshape(y, length(c), length(y)/length(c));   %�޸��źŵľ�����ʽ�Ա��ڽ��е�������
%     tmp = tmp';                                         %
% %ʵ������������Ƶ��������Ƶ������Լ���һ����Ԫ������������~
%     x = tmp * c;                                        %����ƣ�xΪ��������
%     x = x';                                             % x��Ϊ������
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

