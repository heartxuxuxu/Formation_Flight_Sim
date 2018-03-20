function x = f(x, u)
% Motion Model
% u = [vxt; vyt];当前时刻的速度、角速度
global dt;
 
F = [1 0 0 0
     0 1 0 0
     0 0 1 0
     0 0 0 1];
 
B = [dt 0
     dt 0
      1 0
      0 1];

x(1:4)= F*x(1:4)+B*u;

x(5)=atan2(x(4),x(3));