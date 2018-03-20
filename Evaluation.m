function [evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam)% 评价函数的计算
% 
evalDB=[];
trajDB=[];
for vxt=Vr(1):model(4):Vr(2)
    for vyt=Vr(3):model(4):Vr(4)%对于所有可能的速度和角速度
        % 轨迹推测; 得到 xt: 机器人向前运动后的预测位姿; traj: 当前时刻 到 预测时刻之间的轨迹
        [xt,traj]=GenerateTrajectory(x,vxt,vyt,evalParam(4));  %evalParam(4),前向模拟时间;
        % 各评价函数的计算
        dist=CalcDistEval(xt,ob,R);
        Predist=CalcPreDist(xt,ob,R);
        dist=dist+Predist;
        heading=CalcHeadingEval(xt,goal);
        vel=sqrt(vxt*vxt+vyt*vyt);
        % 制动距离的计算
        stopDist=CalcBreakingDist(vel,model);
        if dist>stopDist % 
            evalDB=[evalDB;[vxt vyt heading dist vel]];
            trajDB=[trajDB;traj];
        end
    end
end