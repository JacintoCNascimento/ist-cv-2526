
clear all, close all

myPath = 'D:\CVI\JanPIV\teoricas\demos\database\';

img = imread(strcat(myPath,'botas.jpg')); img = rgb2gray(img);

%img = imread(strcat(myPath,'rabbit.jpg'));

hy = fspecial('sobel');
dy = filter2(hy,img);
hx = fliplr(hy');
dx = filter2(hx,img);
mG = sqrt(dx.^2+dy.^2);

figure; hold on
subplot(2,2,1); imshow(img);
subplot(2,2,2); imshow(dy);
subplot(2,2,3); imshow(dx);
subplot(2,2,4); imshow(mat2gray(mG)); drawnow



h = fspecial('sobel');
dh = filter2(h,img,'valid');
dv = filter2(h',img,'valid');
dh2 = dh.^2;
dv2 = dv.^2;


maxVal = max(mG(:));
lb1 = mG >= maxVal/3 & mG < 2*maxVal/3; % vou buscar os edges mais fortes!
imshow(lb1)

[nlin ncol]=size(lb1);
cM = sum(lb1(:))/(nlin*ncol);
lb2 = mG>=2*maxVal/3;
cF = sum(lb2(:))/(nlin*ncol);
lb = lb1+lb2*2;
map = [0 0 0;1 0 0;0 1 0]

figure;imshow(lb+1,map);

figure;imagesc(lb); colormap gray

