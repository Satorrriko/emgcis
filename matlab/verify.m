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

% h = animatedline;  %�����հ׶�̬����
% axis([0 40 5 30])  %��������ϵ��Χ
% x = linspace(0,40,800);
% 
% xlabel('ʱ��');
% ylabel('����');
% 
% for k = 1:length(x)
%     y = (fscanf(arduino,'%d')/100.0);
%     addpoints(h,x(k),y);
%     drawnow
% end