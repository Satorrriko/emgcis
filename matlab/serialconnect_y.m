% clc;%���ڽ��գ�����ɹ���
% clear;
% delete(instrfindall);
% s = serial('COM3'); %���崮�ڶ���
% set(s,'BaudRate',115200); %���ò�����s
% fopen(s); %�򿪴��ڶ���s
% load('modely.mat')
% interval = 25000; %���￪ʼ�Ĵ����Part1��Ĵ�������
% passo = 1;
% t = 1;
% x = 0;
% while(t<interval)
% b = str2num(fgetl(s)); %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
% if length(b)~=0%��ʼ��������
%     for i=[1:100]%����100����
%         b = str2num(fgetl(s));
%         DATA(i,1:2)=b(1:2);%���ݰ����з���DATA������
%     end
%     plot(DATA(1:2));
%     
%     grid;
%     drawnow;
%    %ѭ����ɣ���100����д���
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
%     %�ϲ��õ�����
%     ctrl_y(trainedModely.predictFcn(k))%����Ԥ���ǩ��ʹ��ctrl�������з������
% end
% t = t+passo;
% 
% end
% fclose(s); %�رմ��ڶ���s
%%
clc;%���ڽ��գ�����ɹ���
clear;
delete(instrfindall);
s = serial('COM3'); %���崮�ڶ���
set(s,'BaudRate',115200); %���ò�����s
fopen(s); %�򿪴��ڶ���s
load('modelyn.mat')
interval = 1000; %���￪ʼ�Ĵ����Part1��Ĵ�������
passo = 1;
t = 1;
x = 0;
buffer=0;
buffer2=0;
while(t<interval)
b = str2num(fgetl(s)); %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
if length(b)~=0%��ʼ��������
    for i=[1:100]%����20������
        b = str2num(fgetl(s));
        DATA(i)=b(1);%���ݰ����з���DATA������
    end

   %ѭ����ɣ���100����д���
    f1(1)= jfemg('emav', DATA);
    %    Average Amplitude Change
    f2(1) = jfemg('aac', DATA);
    
    %   Waveform Length
    f3(1) = jfemg('wl',DATA);
    
    %  Maximum Fractal Length
    f4(1) = jfemg('mfl', DATA);
    
    % Root Mean Square
    f5(1) = jfemg('rms', DATA);

    k=[f1 f2 f3 f4 f5]
    %�ϲ��õ�����
    label(1:100)=(trainedModelyn.predictFcn(k));
    buffer=[buffer DATA];
    buffer2=[buffer2 label];
    subplot(2,1,1)
    plot(buffer)
    subplot(2,1,2)
    plot(buffer2);
    
    grid;
    drawnow;
    %y_trainer()%����Ԥ���ǩ��ʹ��ctrl�������з������
end
t = t+passo;

end
fclose(s); %�رմ��ڶ���s