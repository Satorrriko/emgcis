function k = datacq(data_name,point_number,sample_angle)
%UNTITLED data_name,sample_number,point_number,sample_angle,delete_head
%   此处显示详细说明
sample_number=floor(length(data_name)/point_number);
base=floor(mod(length(data_name),point_number)/2);
for loop=1:sample_number
    channel1  = data_name(base+(point_number*(loop-1)):base+(point_number*(loop)),2)';
    channel2 = data_name(base+(point_number*(loop-1)):base+(point_number*(loop)),3)';%
% %     base+(point_number*(loop-1))
% %     base+(point_number*(loop))
%    Enhanced Mean Absolute Value
    f1(loop,1)= jfemg('emav', channel1);
    f1(loop,2) = jfemg('emav', channel2);
%    Average Amplitude Change
    f2(loop,1) = jfemg('aac', channel1);
    f2(loop,2) = jfemg('aac', channel2);

 %   Waveform Length
    f3(loop,1) = jfemg('wl',channel1);
    f3(loop,2) = jfemg('wl',channel2);

  %  Maximum Fractal Length
    f4(loop,1) = jfemg('mfl', channel1);
    f4(loop,2) = jfemg('mfl', channel2);

    % Root Mean Square
    f5(loop,1) = jfemg('rms', channel1);
    f5(loop,2) = jfemg('rms', channel2);
    f5(loop,3)=sample_angle;

end
k=[f1 f2 f3 f4 f5];

end

