clear all;
img1 = imread('0001.jpg');
img2 = imread('0002.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('0001:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('0002:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%display(strcat('0002, RM - R_M:     ', int2str(R1M - R1M2), ', SM - S_M:    ', int2str(S1M - S1M2)));
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('0002 содержит сообщение');
else
    if (abs(R2M - R2M2) + abs(S2M - S2M2) < abs(R1M - R1M2) + abs(S1M - S1M2))
        display('0001 содержит сообщение');
    end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
img1 = imread('0003.jpg');
img2 = imread('0004.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('0003:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('0004:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%display(strcat('0002, RM - R_M:     ', int2str(R1M - R1M2), ', SM - S_M:    ', int2str(S1M - S1M2)));
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('0004 содержит сообщение');
else
    if (abs(R2M - R2M2) + abs(S2M - S2M2) < abs(R1M - R1M2) + abs(S1M - S1M2))
        display('0003 содержит сообщение');
    end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
img1 = imread('Lena_1.jpg');
img2 = imread('Lena_2.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('Lena_1:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('Lena_2:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%display(strcat('0002, RM - R_M:     ', int2str(R1M - R1M2), ', SM - S_M:    ', int2str(S1M - S1M2)));
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('Lena_2 содержит сообщение');
else
    if (abs(R2M - R2M2) + abs(S2M - S2M2) < abs(R1M - R1M2) + abs(S1M - S1M2))
        display('Lena_1 содержит сообщение');
    end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
img1 = imread('sailboat_at_anchor_1.jpg');
img2 = imread('sailboat_at_anchor_2.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('sailboat_at_anchor_1:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('sailboat_at_anchor_2:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%display(strcat('0002, RM - R_M:     ', int2str(R1M - R1M2), ', SM - S_M:    ', int2str(S1M - S1M2)));
if (abs(R2M - R2M2) + abs(S2M - S2M2) > abs(R1M - R1M2) + abs(S1M - S1M2))
    display('sailboat_at_anchor_2 содержит сообщение');
else
    if (abs(R2M - R2M2) + abs(S2M - S2M2) < abs(R1M - R1M2) + abs(S1M - S1M2))
        display('sailboat_at_anchor_1 содержит сообщение');
    end;
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
img1 = imread('image_002.jpg');
img2 = imread('image_003.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('image_002:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('image_003:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%%%
clear all;
img1 = imread('image_004.jpg');
img2 = imread('image_005.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('image_004:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('image_005:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));

%%%
clear all;
img1 = imread('image_006.jpg');
img2 = imread('image_007.jpg');
width = length(img1(1,:,1));
height = length(img1(:,1,1));
b1 = img1(:,:,3);
b2 = img2(:,:,3);

width;
height;

dctb1(:, :) = dct2(b1(1:height, 1:width));
dctb2(:, :) = dct2(b2(1:height, 1:width));

n1 = 8;
n2 = 8;
M = ones(n1*n2, 1);
M2 = 0 - M;
% M = abs(randi(2, n, 1) - 1);
% M2 = 0 - M;

R1M = 0;
R1M2 = 0;
S1M = 0;
S1M2 = 0;

R2M = 0;
R2M2 = 0;
S2M = 0;
S2M2 = 0;

for i=1:n1:length(dctb1(1,:))
    for j=1:n2:length(dctb1(:,1))
%    jj = floor(i/n + 1);
    gr1 = dctb1(j:j+n2-1,i:i+n1-1);
    gr2 = dctb2(j:j+n2-1,i:i+n1-1);
    gr1 = gr1(:);
    gr2 = gr2(:);
%     gr1(j,:) = y1(i:i+n - 1);
%     gr2(j,:) = y2(i:i+n - 1);
%     for j = 2:1:n
%         g1(i/n + 1) = g1(i/n + 1) + abs(gr1(i/n + 1,j) - y1(j - 1));
%         g2(i/n + 1) = g2(i/n + 1) + abs(gr2(i/n + 1,j) - y2(j - 1));
%     end;  
    if (rsg(rsF(gr1, M)) - rsg(gr1) > 0)
        R1M = R1M + 1;
    end;
    if (rsg(rsF(gr1, M)) - rsg(gr1) < 0)
        S1M = S1M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) > 0)
        R2M = R2M + 1;
    end;
    if (rsg(rsF(gr2, M)) - rsg(gr2) < 0)
        S2M = S2M + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) > 0)
        R1M2 = R1M2 + 1;
    end;
    if (rsg(rsF(gr1, M2)) - rsg(gr1) < 0)
        S1M2 = S1M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) > 0)
        R2M2 = R2M2 + 1;
    end;
    if (rsg(rsF(gr2, M2)) - rsg(gr2) < 0)
        S2M2 = S2M2 + 1;
    end;
    end;
end;
display(strcat('image_006:     ', int2str(R1M - R1M2), ',', int2str(S1M - S1M2)));
display(strcat('image_007:     ', int2str(R2M - R2M2), ',', int2str(S2M - S2M2)));