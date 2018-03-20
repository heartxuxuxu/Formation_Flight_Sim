function heading=CalcHeadingEval(x,goal)
% heading的评价函数计算
theta=toDegree(x(3));% 机器人朝向
while theta>180
    theta=theta-360;
end
while theta<-180
    theta=theta+360;
end

goalTheta=toDegree(atan2(goal(2)-x(2),goal(1)-x(1)));% 目标点的方位
while goalTheta>180
    goalTheta=goalTheta-360;
end
while goalTheta<-180
    goalTheta=goalTheta+360;
end

if goalTheta>theta
    targetTheta=goalTheta-theta;% [deg]
else
    targetTheta=theta-goalTheta;% [deg]
end



heading=abs(180-targetTheta);