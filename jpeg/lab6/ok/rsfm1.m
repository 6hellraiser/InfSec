function [ result ] = rsfm1( x )
%RSFM1 Summary of this function goes here
%   Detailed explanation goes here
    if (rem(x, 2) == 1)
        result = x + 1;
        if (x > 255)
            x = 0;
        end;
    else
        result = x - 1;
        if (x < 0)
            x = 255;
        end;
    end;
end

