%p=parpool(6)
% clc;%串口接收，待完成功能
% clear;
% delete(instrfindall);
% s = serial('COM3'); %定义串口对象
% set(s,'BaudRate',115200); %设置波特率s
% fopen(s); %打开串口对象s
% load('modely.mat')
% interval = 25000; %这里开始的代码很Part1里的代码类似
% passo = 1;
% t = 1;
% x = 0;
% while(t<interval)
% b = str2num(fgetl(s)); %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
% if length(b)~=0%开始接收数据
%     for i=[1:100]%采样100个点
%         b = str2num(fgetl(s));
%         DATA(i,1:2)=b(1:2);%数据按序列放入DATA待处理
%     end
%     plot(DATA(1:2));
%
%     grid;
%     drawnow;
%    %循环完成，对100点进行处理
%     f1(1)= jfemg('emav', DATA(:,1));
%     f1(2) = jfemg('emav', DATA(:,2));
%     %    Average Amplitude Change
%     f2(1) = jfemg('aac', DATA(:,1));
%     f2(2) = jfemg('aac', DATA(:,2));
%
%     %   Waveform Length
%     f3(1) = jfemg('wl',DATA(:,1));
%     f3(2) = jfemg('wl',DATA(:,2));
%
%     %  Maximum Fractal Length
%     f4(1) = jfemg('mfl', DATA(:,1));
%     f4(2) = jfemg('mfl', DATA(:,2));
%
%     % Root Mean Square
%     f5(1) = jfemg('rms', DATA(:,1));
%     f5(2) = jfemg('rms', DATA(:,2));
%
%     k=[f1 f2 f3 f4 f5];
%     %合并得到特征
%     ctrl_y(trainedModely.predictFcn(k))%根据预测标签，使用ctrl函数进行方向控制
% end
% t = t+passo;
%
% end
% fclose(s); %关闭串口对象s
%%
clc;%串口接收，待完成功能
clear;
delete(instrfindall);
s = serial('COM3'); %定义串口对象
set(s,'BaudRate',115200); %设置波特率s
fopen(s); %打开串口对象s
load('ModelGUI.mat','Model20211216T020742')
trainedModel=Model20211216T020742;
interval = 10000; %这里开始的代码很Part1里的代码类似
passo = 1;
t = 1;
x = 0;
k=[];
buffer=[0;0;0];
buffer2=0;
while(t<interval)
    b = str2num(fgetl(s)); %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
    if length(b)~=0%开始接收数据
        for i=[1:100]%采样20个数据
            b = str2num(fgetl(s));
            DATA(i,1:3)=b(1:3);%数据按序列放入DATA待处理
        end
        
        %循环完成，对100点进行处理
        f1(1)= jfemg('emav', DATA(:,1));
        f1(2) = jfemg('emav', DATA(:,2));
        f1(3) = jfemg('emav', DATA(:,3));
        
        %    Average Amplitude Change
        f2(1) = jfemg('aac', DATA(:,1));
        f2(2) = jfemg('aac', DATA(:,2));
        f2(3) = jfemg('aac', DATA(:,3));
        
        %   Waveform Length
        f3(1) = jfemg('wl',DATA(:,1));
        f3(2) = jfemg('wl',DATA(:,2));
        f3(3) = jfemg('wl',DATA(:,3));
        
        %  Maximum Fractal Length
        f4(1) = jfemg('mfl', DATA(:,1));
        f4(2) = jfemg('mfl', DATA(:,2));
        f4(3) = jfemg('mfl', DATA(:,3));
        
        % Root Mean Square
        f5(1) = jfemg('rms', DATA(:,1));
        f5(2) = jfemg('rms', DATA(:,2));
        f5(3) = jfemg('rms', DATA(:,3));
        
        k=[f1 f2 f3 f4 f5];
        %合并得到特征
        %label(1:100)=(trainedModelyn.predictFcn(k));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         buffer=[buffer DATA'];
%         subplot(2,1,1)
%         plot(buffer')
%         
%         subplot(2,1,2)
%         
%         grid on;
%         [x,y]=train(trainedModel.predictFcn([f1 f2 f3 f4 f5]));
%         fill(x,y,'r');  %用r：红色进行填充
%         axis([0 3 0 3]);%让坐标横纵轴都显示在0-3范围内
%         drawnow;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ctrl_y(trainedModel.predictFcn(k))
        %%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
        
        %y_trainer()%根据预测标签，使用ctrl函数进行方向控制
    end
    t = t+passo;
end

sound(sin(2*pi*25*(1:4000)/100));
%save('data.mat','d4','-append','-nocompression')
fclose(s); %关闭串口对象s

