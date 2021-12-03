clc;
clear;
close all;
DATA0=load("D:\Developments\00.EMG\git\emgcis\database\0.txt",'-ASCII');
%DATA0=lowpass(DATA0,200,200);
base2=sum(DATA0(2,:))/length(DATA0(2,:));
base3=sum(DATA0(3,:))/length(DATA0(3,:));
DATA0(2,:)=DATA0(2,:)-base2;
DATA0(3,:)=DATA0(3,:)-base3;

DATA30L=load("D:\Developments\00.EMG\git\emgcis\database\30l.txt",'-ASCII');
%DATA30L=lowpass(DATA30L,200,200);
DATA30L(2,:)=DATA30L(2,:)-base2;
DATA30L(3,:)=DATA30L(3,:)-base3;

DATA30R=load("D:\Developments\00.EMG\git\emgcis\database\30r.txt",'-ASCII');
%DATA30R=lowpass(DATA30R,200,200);
DATA30R(2,:)=DATA30R(2,:)-base2;
DATA30R(3,:)=DATA30R(3,:)-base3;

DATA60L=load("D:\Developments\00.EMG\git\emgcis\database\60l.txt",'-ASCII');
%DATA60L=lowpass(DATA60L,200,200);
DATA60L(2,:)=DATA60L(2,:)-base2;
DATA60L(3,:)=DATA60L(3,:)-base3;

DATA60R=load("D:\Developments\00.EMG\git\emgcis\database\60r.txt",'-ASCII');
%DATA60R=lowpass(DATA60R,200,200);
DATA60R(2,:)=DATA60R(2,:)-base2;
DATA60R(3,:)=DATA60R(3,:)-base3;

DATA45R=load("D:\Developments\00.EMG\git\emgcis\database\45r.txt",'-ASCII');
%DATA0=lowpass(DATA0,200,200);
DATA45R(2,:)=DATA45R(2,:)-base2;
DATA45R(3,:)=DATA45R(3,:)-base3;

DATA45L=load("D:\Developments\00.EMG\git\emgcis\database\45l.txt",'-ASCII');
%DATA45L=lowpass(DATA45L,200,200);
DATA45L(2,:)=DATA45L(2,:)-base2;
DATA45L(3,:)=DATA45L(3,:)-base3;

TESTDATA=load("D:\Developments\00.EMG\git\emgcis\database\TESTDATA.txt",'-ASCII');
%TESTDATA=lowpass(TESTDATA,200,200);
TESTDATA(2,:)=TESTDATA(2,:)-base2;
TESTDATA(3,:)=TESTDATA(3,:)-base3;

TESTDATA2=load("D:\Developments\00.EMG\git\emgcis\database\TESTDATA2.txt",'-ASCII');
%TESTDATA2=lowpass(TESTDATA2,200,200);
TESTDATA2(2,:)=TESTDATA2(2,:)-base2;
TESTDATA2(3,:)=TESTDATA2(3,:)-base3;

test1=load("D:\Developments\00.EMG\git\emgcis\database\00.txt",'-ASCII');
%test1=lowpass(test1,200,200);
test1(2,:)=test1(2,:)-base2;
test1(3,:)=test1(3,:)-base3;

fs = 200;            % Sampling frequency
Ts = 1 / fs;          % Period
t  = 0 : Ts : 2;

%dataacq(数据名,数据长度,标签)
T0=datacq(DATA0,100,0);
T1=datacq(DATA30R,100,20);
T2=datacq(DATA30L,100,-20);
T3=datacq(DATA60L,100,-60);
T4=datacq(DATA60R,100,60);
T5=datacq(DATA45R,100,45);
T6=datacq(DATA45L,100,-45);
T7=datacq(TESTDATA,100,1);
T8=datacq(TESTDATA2,100,1);
T9=datacq(test1,100,1);

T=[T0;T1;T2;T3;T4;T5;T6];
csvwrite('feat.csv',T);