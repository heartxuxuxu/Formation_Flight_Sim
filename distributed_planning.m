
% -------------------------------------------------------------------------
% File : distributed_planning.m
%
% Discription : Distributed planning using DWA for formation
%
% Environment : Matlab
%
% Author : Zhongyan Xu
%
% Date :  2018.1.10
% -------------------------------------------------------------------------

function [x,traj] = distributed_planning(x,Kinematic,goal,evalParam,obstacle,obstacleR)

    % DWA参数输入
    [u,traj]=DynamicWindowApproach(x,Kinematic,goal,evalParam,obstacle,obstacleR);
%     u(1,1)=u(1,1)+0.01*rand(1,1);
    x=f(x,u);% 机器人移动到下一个时刻
    
end




















