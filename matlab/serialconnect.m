clc;%���ڽ��գ�����ɹ���
clear;
delete(instrfindall);
s = serial('COM3'); %���崮�ڶ���
set(s,'BaudRate',115200); %���ò�����s
fopen(s); %�򿪴��ڶ���s

interval = 10000; %���￪ʼ�Ĵ����Part1��Ĵ�������
passo = 1;
t = 1;
x = 0;
while(t<interval)
b = str2num(fgetl(s)); %�ú���fget(s)�ӻ�������ȡ�������ݣ���������ֹ�������з���ֹͣ��
x = [x,b] %
plot(x);
grid
t = t+passo;
drawnow;
end
fclose(s); %�رմ��ڶ���s