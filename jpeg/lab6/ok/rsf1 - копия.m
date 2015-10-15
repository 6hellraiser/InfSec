function [ result ] = rsf1( x )
%RSF1 Summary of this function goes here
%   Detailed explanation goes here
    if (rem(x, 2) == 1)
        result = x - 1;
    else
        result = x + 1;
    end;
end

