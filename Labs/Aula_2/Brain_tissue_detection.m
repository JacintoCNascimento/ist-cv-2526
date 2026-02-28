
clear all, close all

% ------------- primeiro exemplo, brain detection  ----------------- %

img = imread('BrainMRI_Axial.jpg');

imgg = rgb2gray(img);
figure,
subplot(2,3,1); imshow(imgg);

BW = imgg>60;
 
subplot(2,3,2);imshow(BW);title('Original BW');
se = strel('disk',3);    % change this !!!
%se = strel('square',3); % change this to 'square', 'line', 'disk', 'ball' 
%se = strel('ball',3);   % change this to 'square', 'line', 'disk', 'ball' 

BW1 = imerode(BW,se);
subplot(2,3,3);imshow(BW1);title('Erosion');

BW2 = imdilate(BW,se);
subplot(2,3,4);imshow(BW2),title('Dilation');

BW3 = imopen(BW,se);
subplot(2,3,5);imshow(BW3),title('Aperture');

BW4 = imclose(BW,se);
subplot(2,3,6);imshow(BW4),title('Close');

[lb num]= bwlabel(BW3); %estava BW3
figure,imshow(mat2gray(lb));title('Labels'); hold on, colormap hot
figure,imshow(mat2gray(lb));title('Labels'); hold on, colormap jet

% options to see the colormap of the figure
%colormap hot
%colormap jet

stats = regionprops(lb);
areas = [stats.Area];
[dummy indM] = max(areas);
imgBr = (lb == indM);
figure,imshow(imgBr);title('Larger área');
figure,imshow(imgg.*uint8(imgBr));title('Brain');

% ------------------------ segundo exemplo ----------------------------- %

img = imread('rabbitBW.jpg');
imshow(img); title('Original');
figure, hold on,
imshow(img);
se = strel('disk',3);
for k = 1 : 20
    k
    img = imerode(img,se);
    imshow(img); drawnow
    pause(.2)
end
% ------------------------ terceiro exemplo ----------------------------- %
img = imread('rabbitBW.jpg');
imshow(img); title('Original');
figure, hold on,
imshow(img);
se = strel('disk',3);
for k = 1 : 20
    img = imdilate(img,se);
    imshow(img); drawnow
    pause(.2)
end



