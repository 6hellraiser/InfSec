clear all;
fid1 = fopen('0001.jpg', 'rb');
fid2 = fopen('0002.jpg', 'rb');
img1 = fread(fid1, inf, '*uint8');%dec2hex(fread(fid1, inf, '*uint8'));
img2 = fread(fid2, inf, '*uint8');%dec2hex(fread(fid2, inf, '*uint8'));

for i=1:1:length(img1)
   if ((img1(i) == hex2dec('FF')) && (img2(i) == hex2dec('DB')))
       count = 1;
   end;
end;

fclose(fid1);
fclose(fid2);