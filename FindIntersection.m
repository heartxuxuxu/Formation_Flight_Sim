 
%????????,?????
% L1: A1(m1,n1),B1(m2,n2)?????? A1*x+B1*y+C1=0;
% L2: A2(m3,n3),B2(m4,n4)?????? A2*x+B2*y+C2=0;
% a,???????
% Pt?????
function [Pt b]=FindIntersection(m1,n1,m2,n2,m3,n3,m4,n4)
A1=n2-n1; B1=m1-m2; C1=m2*n1-m1*n2;
A2=n4-n3; B2=m3-m4; C2=m4*n3-m3*n4;
A=[A1,B1;A2,B2];B=[-C1;-C2];
Pt=A\B;
a=isreal(Pt);
b=0;
if a==1
    if Pt(1)>=min(m1,m2) && Pt(1)<=max(m1,m2) && Pt(2)>=min(n1,n2) && Pt(2)<=max(n1,n2)
        b=1;
    end
end

