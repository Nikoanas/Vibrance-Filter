function [ result1 ] = Transf(g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1=0.314;

y1=0.0;
x2=0.75;
%x2 = 0.35
y2=1;
if g<x1
    result1=0;
else if g>x2
        result1=1;
    else 
        %result1 = 0;
        result1 = ((3)^(1/2))*g ;
       % result1=y1+(y2-y1)*(g-x1)/(x2-x1);
    end

end

