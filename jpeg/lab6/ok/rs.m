%6, 8, 9
clear all;
img1 = imread('0005.bmp');
img2 = imread('0006.bmp');
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
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

M = abs(randi(2, n, 1) - 1);
M2 = 0 - M;
lastJ = 1;
for i=1:n:length(y1)-1
    j = floor(i/n + 1);
    gr1(j,:) = y1(i:i+n - 1);
    gr2(j,:) = y2(i:i+n - 1);
if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) < 0)
        S2M2 = S2M2 + 1;
    end;
end;

display('0005, RM - R_M, SM - S_M:');
R1M - R1M2
S1M - S1M2
display('0006, RM - R_M, SM - S_M:');
R2M - R2M2
S2M - S2M2
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('0006 содержит сообщение');
else
    display('0005 содержит сообщение');
end;

clear all;
img1 = imread('0007.bmp');
img2 = imread('0008.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3); % Get the BLUE matrix
b2 = img2(:,:,3); % Get the BLUE matrix

y1 = b1(:);
y2 = b2(:);
n = 128;

gr1 = zeros(length(y1)/n, n);
gr2 = zeros(length(y2)/n, n);

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

M = abs(randi(2, n, 1) - 1);
M2 = 0 - M;
lastJ = 1;
for i=1:n:length(y1)-1
    j = floor(i/n + 1);
    gr1(j,:) = y1(i:i+n - 1);
    gr2(j,:) = y2(i:i+n - 1);
if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) < 0)
        S2M2 = S2M2 + 1;
    end;
end;

display('0007, RM - R_M, SM - S_M:');
R1M - R1M2
S1M - S1M2
display('0008, RM - R_M, SM - S_M:');
R2M - R2M2
S2M - S2M2
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('0008 содержит сообщение');
else
    display('0007 содержит сообщение');
end;

clear all;
img1 = imread('0009.bmp');
img2 = imread('0010.bmp');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3); % Get the BLUE matrix
b2 = img2(:,:,3); % Get the BLUE matrix

y1 = b1(:);
y2 = b2(:);
n = 128;

gr1 = zeros(length(y1)/n, n);
gr2 = zeros(length(y2)/n, n);

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

M = abs(randi(2, n, 1) - 1);
M2 = 0 - M;
lastJ = 1;
for i=1:n:length(y1)-1
    j = floor(i/n + 1);
    gr1(j,:) = y1(i:i+n - 1);
    gr2(j,:) = y2(i:i+n - 1);
if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M)) - rsg(gr1(j, :)) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2(j, :), M)) - rsg(gr2(j, :)) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1(j, :), M2)) - rsg(gr1(j, :)) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2(j, :), M2)) - rsg(gr2(j, :)) < 0)
        S2M2 = S2M2 + 1;
    end;
end;

display('0009, RM - R_M, SM - S_M:');
R1M - R1M2
S1M - S1M2
display('0010, RM - R_M, SM - S_M:');
R2M - R2M2
S2M - S2M2
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('0010 содержит сообщение');
else
    display('0009 содержит сообщение');
end;