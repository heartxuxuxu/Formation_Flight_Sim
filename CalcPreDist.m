function Predist=CalcPreDist(x,ob,R)
%CALCPREDIST Summary of this function goes here
%   Detailed explanation goes here
global dt;
Predist=100;
pre_ob(:,:)=ob(:,:);
F_ob = [1 0 0 0;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1];

for io=1:length(ob(:,1))
    B_ob = [dt*cos(pre_ob(io,3))*pre_ob(io,4);
            dt*sin(pre_ob(io,3))*pre_ob(io,4);
            0;
            0];
    for time=0:dt:3.0
        pre_ob(io,:)=(F_ob*pre_ob(io,:)'+B_ob)';%cos(pre_ob(3))
    end
    Predisttmp=norm(pre_ob(io,1:2)-x(1:2)')-R;%僷僗偺埵抲偲?釆Q暔偲偺僲儖儉岆?穫饘v嶼
    if Predist>Predisttmp% 离障碍物最小的距离
        Predist=Predisttmp;
    end
    if pre_ob(io,4)<0.2
        Predist=3*R;
    end
end

% 障碍物距离评价限定一个最大值，如果不设定，一旦一条轨迹没有障碍物，将太占比重
if Predist>=3*R
    Predist=3*R;
end

end

