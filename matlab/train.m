function [x,y]=train(num)
switch num
    case 1
        x=[0 0 1 1];
        y=[0 1 1 0];
    case 2
        x=[1 1 2 2];
        y=[0 1 1 0];
    case 3
        x=[2 2 3 3];
        y=[0 1 1 0];
    case 4
        x=[0 0 1 1];
        y=[1 2 2 1];
    case 5
        x=[1 1 2 2];
        y=[1 2 2 1];
    case 6
        x=[2 2 3 3];
        y=[1 2 2 1];
    case 7
        x=[0 0 1 1];
        y=[2 3 3 2];
    case 8
        x=[1 1 2 2];
        y=[2 3 3 2];
    case 9
        x=[2 2 3 3];
        y=[2 3 3 2];
end
end
