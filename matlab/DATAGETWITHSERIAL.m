a1=buffer(1:30050)';
 
a2=buffer(30000:60001)';


Y1=datacq1(a1,100,46);

Y2=datacq1(a2,100,8);
Y=[Y1;Y2];
