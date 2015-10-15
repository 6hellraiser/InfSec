function [ result ] = rsg( x )
%RSG Summary of this function goes here
%   Detailed explanation goes here
result = 0;
n = length(x);
    for i = 1:1:n-1
        result = result + abs(x(i + 1) - x(i));
    end;

end

