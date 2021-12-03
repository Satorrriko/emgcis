clc;%串口接收，待完成功能
clear;
delete(instrfindall);
s = serial('COM3'); %定义串口对象
set(s,'BaudRate',115200); %设置波特率s
fopen(s); %打开串口对象s

interval = 10000; %这里开始的代码很Part1里的代码类似
passo = 1;
t = 1;
x = 0;
while(t<interval)
b = str2num(fgetl(s)); %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
x = [x,b] %
plot(x);
grid
t = t+passo;
drawnow;
end
fclose(s); %关闭串口对象s