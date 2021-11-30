DATA0=load("D:\Developments\00.EMG\database\30r.txt",'-ASCII');
fs = 200;            % Sampling frequency
Ts = 1 / fs;          % Period
t  = 0 : Ts : 2;

channel1  = DATA0(5500:5700,2)';
    channel2 = DATA0(5500:5700,3)';%取用于识别
f1(1,1)= jfemg('emav', channel1);
    f1(1,2) = jfemg('emav', channel2);
    
%    Average Amplitude Change
    f2(1,1) = jfemg('aac', channel1);
    f2(1,2) = jfemg('aac', channel2);
 %   Waveform Length
    f3(1,1) = jfemg('wl',channel1);
    f3(1,2) = jfemg('wl',channel2);
  %  Maximum Fractal Length
    f4(1,1) = jfemg('mfl', channel1);
    f4(1,2) = jfemg('mfl', channel2);
   % Root Mean Square
    f5(1,1) = jfemg('rms', channel1);
    f5(1,2) = jfemg('rms', channel2);
     feattest = [f1 f2 f3 f4 f5];
