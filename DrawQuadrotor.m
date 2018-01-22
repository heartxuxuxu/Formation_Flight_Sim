function [ ] = DrawQuadrotor( x,y )
%DRAWQUADROTOR Summary of this function goes here
%   Detailed explanation goes here
rotor_R=0.15;
wheelbase=0.2;
offset=(wheelbase/2+rotor_R)/sqrt(2);
rectangle('Position',[x-offset-rotor_R,y-offset-rotor_R,2*rotor_R,2*rotor_R],'Curvature',[1,1],'edgecolor','k'),axis equal
rectangle('Position',[x-offset-rotor_R,y+offset-rotor_R,2*rotor_R,2*rotor_R],'Curvature',[1,1],'edgecolor','r'),axis equal
rectangle('Position',[x+offset-rotor_R,y-offset-rotor_R,2*rotor_R,2*rotor_R],'Curvature',[1,1],'edgecolor','k'),axis equal
rectangle('Position',[x+offset-rotor_R,y+offset-rotor_R,2*rotor_R,2*rotor_R],'Curvature',[1,1],'edgecolor','r'),axis equal
end

