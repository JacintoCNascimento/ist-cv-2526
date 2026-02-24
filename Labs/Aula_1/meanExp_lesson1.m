
clear all, close all

img = imread('veiculoGray.jpg');

% ----------- Introduce noise ----
imageN = imnoise(img,'gaussian',0,0.12);
figure;
subplot(1,2,1);imshow(img); colormap gray
subplot(1,2,2);imshow(imageN);

% ----------- mean experience ---- 
h = fspecial('average',19);
imageF = imfilter(imageN,h);
figure;
subplot(1,2,1);imshow(imageN); title('Image with noise');
subplot(1,2,2);imshow(imageF); title('Filtered Image');

% ---------- median experience 

imgNoise = imnoise(img,'salt & pepper',0.15);
imgMed = medfilt2(imgNoise);
figure;  
subplot(1,2,1); imagesc(imgNoise);colormap gray, title('Noisy Image');
subplot(1,2,2); imagesc(imgMed);colormap gray, title('Image without Noise !');

% -----------------

N = 20;
h = fspecial('average',N);
imageF_original = imfilter(img,h);

figure;
subplot(1,2,1);imshow(imageF); title('Filtered Image');
subplot(1,2,2);imshow(imageF_original);  title('Filtering again the  Image');

% ---------- median experience 

imgNoise = imnoise(img,'salt & pepper',0.15);
imgMed = medfilt2(imgNoise);
figure;  
subplot(1,2,1); imagesc(imgNoise);colormap gray, title('Noisy Image');
subplot(1,2,2); imagesc(imgMed);colormap gray, title('Image without Noise !');








