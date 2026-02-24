
clear all, close all,

% 1st example using 
% noise   -> Salt & pepper
% denoise -> median filter
img = imread('veiculoGray.jpg');

% ------ Introduce Noise ----
imageN = imnoise(img,'salt & pepper',0.09);
imageF = medfilt2(imageN);

figure;
subplot(1,2,1);imshow(imageN);
subplot(1,2,2); imshow(imageF);

% 2nd example using
% noise   -> Salt & pepper
% denoise -> median filter
img = imread('eight.tif');
figure,imshow(img);

imageN = imnoise(img,'salt & pepper',0.12);
imageF = medfilt2(imageN);

figure,
subplot(1,2,1);imshow(imageN);
subplot(1,2,2); imshow(imageF);

% 2nd example using
% denoise -> mean filter
K = filter2(fspecial('average',3),imageN)/255;
KK = filter2(fspecial('average',3),imageN);

figure,imshow(K);
figure; imagesc(KK); colormap gray


