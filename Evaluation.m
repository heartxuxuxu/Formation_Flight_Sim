function [evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam)% 评价函数的计算
% 
evalDB=[];
trajDB=[];
for vt=Vr(1):model(5):Vr(2)
    for ot=Vr(3):model(6):Vr(4)%对于所有可能的速度和角速度
        % 轨迹推测; 得到 xt: 机器人向前运动后的预测位姿; traj: 当前时刻 到 预测时刻之间的轨迹
        [xt,traj]=GenerateTrajectory(x,vt,ot,evalParam(4),model);  %evalParam(4),前向模拟时间;
        % 各评价函数的计算
        dist=CalcDistEval(xt,ob,R);
        Predist=CalcPreDist(xt,ob,R);
        dist=dist+Predist;
        heading=CalcHeadingEval(xt,goal);
        vel=abs(vt);
        % 制动距离的计算
%         str=['dist ' num2str(dist) 'head ' num2str(heading) 'vel ' num2str(vel)];
%         disp(str);
        stopDist=CalcBreakingDist(vel,model);
        if dist>stopDist % 
            evalDB=[evalDB;[vt ot heading dist vel]];
            trajDB=[trajDB;traj];
        end
    end
end