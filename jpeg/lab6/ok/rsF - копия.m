function [ result ] = rsF( Gr, M )
    n = length(Gr);
    result = zeros(n, 1);
    for i=1:1:n
        if (M(i) == 1)
            result(i) = rsf1(Gr(i));
        end;
        if (M(i) == -1)
            result(i) = rsfm1(Gr(i));
        end;
        if (M(i) == 0)
            result(i) = Gr(i);
        end;
    end;
end

