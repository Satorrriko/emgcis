clc;
clear;
close all;
DATA0=load("D:\Developments\00.EMG\database\0ตออจ1.txt",'-ASCII');
plot(DATA0(:,2))
hold on;
plot(DATA0(:,3))

fs = 200;            % Sampling frequency 
Ts = 1 / fs;          % Period
t  = 0 : Ts : 2;
X=DATA0(:,2);
f3 = jfemg('w1',X); 
% 
% for i=1:10 
% channel1  = DATA0((260+200*(i-1)):(260+200*(i)),2)'
% channel2 = DATA0((260+200*(i-1)):(260+200*(i)),3)'
% % Enhanced Mean Absolute Value
% f1(i,1)= jfemg('emav', channel1);
% f1(i,2) = jfemg('emav', channel2); 
% 
% % Average Amplitude Change
% f2(i,1) = jfemg('aac', channel1); 
% f2(i,2) = jfemg('aac', channel2); 
% % Waveform Length
% % f3(i,1) = jfemg('w1',channel1); 
% % f3(i,2) = jfemg('w1',channel2); 
% % Maximum Fractal Length 
% f4(i,1) = jfemg('mfl', channel1); 
% f4(i,2) = jfemg('mfl', channel2); 
% % Root Mean Square
% f5(i,1) = jfemg('rms', channel1); 
% f5(i,2) = jfemg('rms', channel2); 
% end
% % Feature vector
% %feat = [f1, f2, f3, f4, f5];
