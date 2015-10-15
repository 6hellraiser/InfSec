clear all;
img1 = imread('0005.bmp');
img2 = imread('0006.bmp');
% img1 = imread('0007.bmp');
% img2 = imread('0008.bmp');
% img1 = imread('0009.bmp');
% img2 = imread('0010.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

y1 = b1(:);
y2 = b2(:);

n = 32;

gr1 = zeros(length(y1)/n, n);
gr2 = zeros(length(y2)/n, n);

R1M = 0;
R1Mmin = 0;

S1M = 0;
S1Mmin = 0;

R2M = 0;
R2Mmin = 0;
S2M = 0;
S2Mmin = 0;

M = abs(randi(2, n, 1) - 1);
Mmin = 0 - M;
for i=1:n:length(y1)-1
    j = floor(i/n + 1);
    gr1(j,:) = y1(i:i+n - 1);
    gr2(j,:) = y2(i:i+n - 1);
    
    F = rsF(gr1(j, :), M);
    g = rsg(F);
    g1 = rsg(gr1(j, :));
    if (g - g1 > 0)
        R1M = R1M + 1;
    end;
    if (g - g1 < 0)
        S1M = S1M + 1;
    end;
    
    F = rsF(gr2(j, :), M);
    g = rsg(F);
    g1 = rsg(gr2(j, :));
    if (g - g1 > 0)
        R2M = R2M + 1;
    end;
    if (g - g1 < 0)
        S2M = S2M + 1;
    end;
    
    F = rsF(gr1(j, :), Mmin);
    g = rsg(F);
    g1 = rsg(gr1(j, :));
    if (g - g1 > 0)
        R1Mmin = R1Mmin + 1;
    end;
    if (g - g1 < 0)
        S1Mmin = S1Mmin + 1;
    end;
    
    F = rsF(gr2(j, :), Mmin);
    g = rsg(F);
    g1 = rsg(gr2(j, :));
    if (g - g1 > 0)
        R2Mmin = R2Mmin + 1;
    end;
    if (g - g1 < 0)
        S2Mmin = S2Mmin + 1;
    end;
end;

if (abs(R2M - R2Mmin) + abs(S2M - S2Mmin) > abs(R1M - R1Mmin) + abs(S1M - S1Mmin))
    display('Second');
else
    display('First');
end;