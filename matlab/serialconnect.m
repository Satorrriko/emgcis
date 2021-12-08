clc;%串口接收，待完成功能
clear;
delete(instrfindall);
s = serial('COM3'); %定义串口对象
set(s,'BaudRate',115200); %设置波特率s
fopen(s); %打开串口对象s
load('model1.mat')
interval = 25000; %这里开始的代码很Part1里的代码类似
passo = 1;
t = 1;
x = 0;
while(t<interval)
b = str2num(fgetl(s)); %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
if length(b)~=0%开始接收数据
    for i=[1:100]%采样100个点
        b = str2num(fgetl(s));
        DATA(i,1:2)=b(1:2);%数据按序列放入DATA待处理
    end
    %循环完成，对100点进行处理
    f1(1)= jfemg('emav', DATA(:,1));
    f1(2) = jfemg('emav', DATA(:,2));
    %    Average Amplitude Change
    f2(1) = jfemg('aac', DATA(:,1));
    f2(2) = jfemg('aac', DATA(:,2));
    
    %   Waveform Length
    f3(1) = jfemg('wl',DATA(:,1));
    f3(2) = jfemg('wl',DATA(:,2));
    
    %  Maximum Fractal Length
    f4(1) = jfemg('mfl', DATA(:,1));
    f4(2) = jfemg('mfl', DATA(:,2));
    
    % Root Mean Square
    f5(1) = jfemg('rms', DATA(:,1));
    f5(2) = jfemg('rms', DATA(:,2));

    k=[f1 f2 f3 f4 f5];
    %合并得到特征
    ctrl(trainedModel1.predictFcn(k))%根据预测标签，使用ctrl函数进行方向控制
end
t = t+passo;

end
fclose(s); %关闭串口对象s