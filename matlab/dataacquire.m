clc;
clear;
close all;
import java.awt.Robot;
import java.awt.event.*;%控制键盘需要

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
%%
DATAmid=load("C:\Users\Komeiji Satori\Desktop\MyoFile\SignalTimeRecord\5.txt",'-ASCII');
%test1=lowpass(test1,200,200);
%base11=sum(DATAmid(2,:))/length(DATAmid(2,:));
%DATAmid(2,:)=DATAmid(2,:)-base11;

DATAup=load("C:\Users\Komeiji Satori\Desktop\MyoFile\SignalTimeRecord\8.txt",'-ASCII');
%test1=lowpass(test1,200,200);
%DATAup(2,:)=DATAup(2,:)-base11;

DATAdown=load("C:\Users\Komeiji Satori\Desktop\MyoFile\SignalTimeRecord\2.txt",'-ASCII');
%test1=lowpass(test1,200,200);
%DATAdown(2,:)=DATAdown(2,:)-base11;
%%

fs = 200;            % Sampling frequency
Ts = 1 / fs;          % Period
t  = 0 : Ts : 2;
%%
%训练只用了60度的数据和静止的数据
%dataacq(数据名,数据长度,标签)
T0=datacq(DATA0,100,2);
%T1=datacq(DATA30R,100,3);
%T2=datacq(DATA30L,100,1);
T3=datacq(DATA60L,100,1);
T4=datacq(DATA60R,100,3);
%T5=datacq(DATA45R,100,3);
%T6=datacq(DATA45L,100,1);
T7=datacq(TESTDATA,100,1);
T8=datacq(TESTDATA2,100,1);
T9=datacq(test1,100,1);

T=[T0;T3;T4];
csvwrite('feat.csv',T);

%dataacq(数据名,数据长度,标签)
y0=datacq1(DATAmid,100,5);
%T1=datacq(DATA30R,100,3);
%T2=datacq(DATA30L,100,1);
y1=datacq1(DATAup,100,6);
y2=datacq1(DATAdown,100,4);
%T5=datacq(DATA45R,100,3);
%T6=datacq(DATA45L,100,1);


y=[y0;y1;y2];
csvwrite('feat.csv',y);