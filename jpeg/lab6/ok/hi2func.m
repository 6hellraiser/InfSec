function [ result ] = hi2func( y )
result = 0;
n = 256;
        count = zeros(n,1);
        sizeX = length(y(1,:));
        sizeY = length(y(:,1));
        for i=1:1:sizeX
            for j=1:1:sizeY
                count(y(j, i) + 1, 1) = count(y(j, i) + 1, 1) + 1;
            end;
        end;
        x = zeros(n / 2,1);
        y = zeros(n / 2,1);
        z = zeros(n / 2,1);
        for i = 1:1:(n / 2)
            x(i, 1) = count((i - 1)*2 + 1, 1);
            y(i, 1) = count(i*2, 1);
            z(i, 1) = (x(i, 1) + y(i, 1))/2;
            if (z(i,1) > 2)
                result = result + (((x(i, 1) - z(i, 1))^2)/z(i, 1));
            end;
        end;
end

