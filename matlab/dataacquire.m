clc;
clear;
close all;
DATA0=load("C:\Users\ZJohnny\Documents\GitHub\emgcis\database\0低通1.txt",'-ASCII');
DATA30L=load("C:\Users\ZJohnny\Documents\GitHub\emgcis\database\30l.txt",'-ASCII');
DATA30R=load("C:\Users\ZJohnny\Documents\GitHub\emgcis\database\30r.txt",'-ASCII');
DATA60L=load("C:\Users\ZJohnny\Documents\GitHub\emgcis\database\60l.txt",'-ASCII');
DATA60R=load("C:\Users\ZJohnny\Documents\GitHub\emgcis\database\60r.txt",'-ASCII');



fs = 200;            % Sampling frequency
Ts = 1 / fs;          % Period
t  = 0 : Ts : 2;


T0=datacq(DATA0,200,0);
T1=datacq(DATA30R,200,30);
T2=datacq(DATA30L,200,-30);
T3=datacq(DATA60L,200,-60);
T4=datacq(DATA60R,200,60);
T=[T0;T1;T2;T3;T4];
csvwrite('feat.csv',T);