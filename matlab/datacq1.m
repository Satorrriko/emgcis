function k = datacq1(data_name,point_number,sample_angle)
%UNTITLED data_name,sample_number,point_number,sample_angle,delete_head
%   此处显示详细说明
sample_number=floor(length(data_name)/point_number);
base=floor(mod(length(data_name),point_number)/2);
for loop=1:sample_number
    channel1  = data_name(base+(point_number*(loop-1)):base+(point_number*(loop)),1)';
% %     base+(point_number*(loop-1))
% %     base+(point_number*(loop))
%    Enhanced Mean Absolute Value
    f1(loop,1)= jfemg('emav', channel1);
%    Average Amplitude Change
    f2(loop,1) = jfemg('aac', channel1);

 %   Waveform Length
    f3(loop,1) = jfemg('wl',channel1);

  %  Maximum Fractal Length
    f4(loop,1) = jfemg('mfl', channel1);

    % Root Mean Square
    f5(loop,1) = jfemg('rms', channel1);
    f5(loop,2)=sample_angle;

end
k=[f1 f2 f3 f4 f5];

end

