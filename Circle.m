function [  ] = Circle(x,y,r)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1],'edgecolor','m'),axis equal

end
