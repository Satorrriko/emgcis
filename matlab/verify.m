% for i=1:127
%     predict(i)=trainedModel.predictFcn(T8(i,1:10))
% end
% x1=lowpass(predict,250,200)
% plot(x1)
% hold on
import java.awt.Robot;
import java.awt.event.*;
for i=1:176
    predict(i)=trainedModel.predictFcn(T9(i,1:10));
    ctrl(predict(i));
    pause(0.05)
end

% h = animatedline;  %创建空白动态曲线
% axis([0 40 5 30])  %设置坐标系范围
% x = linspace(0,40,800);
% 
% xlabel('时间');
% ylabel('距离');
% 
% for k = 1:length(x)
%     y = (fscanf(arduino,'%d')/100.0);
%     addpoints(h,x(k),y);
%     drawnow
% end