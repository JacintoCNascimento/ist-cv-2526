

% Diferença de histogramas de imagens a cores,
% como medida de (de)semelhança 

clear all,

myPath = 'D:\CVI\JanPIV\teoricas\demos\database\';

N = 100; % Histograma de côr com 100 bins 

img1 = imread(strcat(myPath,'ped7c1352.tif'));
figure,
subplot(2,3,1);imshow(img1);
[nlin ncol dummy]=size(img1);
npixels = nlin*ncol;
hr = imhist(img1(:,:,1),N)/npixels;  
hg = imhist(img1(:,:,2),N)/npixels;
hb = imhist(img1(:,:,3),N)/npixels;
H1 = [hr' hg' hb'];
subplot(2,3,4),bar(H1);

img2 = imread(strcat(myPath,'ped7c1350.tif'));
subplot(2,3,2);imshow(img2);
[nlin ncol dummy]=size(img2);
npixels = nlin*ncol;
hr = imhist(img2(:,:,1),N)/npixels;
hg = imhist(img2(:,:,2),N)/npixels;
hb = imhist(img2(:,:,3),N)/npixels;
H2 = [hr' hg' hb'];
subplot(2,3,5),bar(H2);

img3 = imread(strcat(myPath,'Tiger2.jpg'));
subplot(2,3,3),imshow(img3);
[nlin ncol dummy]=size(img3);
npixels = nlin*ncol;
hr = imhist(img3(:,:,1),N)/npixels;
hg = imhist(img3(:,:,2),N)/npixels;
hb = imhist(img3(:,:,3),N)/npixels;
H3 = [hr' hg' hb'];
subplot(2,3,6),bar(H3);

% ----------- Computation of similarity metrics ------------- %

d12 = sum(abs(H1-H2))/length(H1);
d13 = sum(abs(H1-H3))/length(H1);

Distances = [d12 d13]  

% -------------------------------
intersection_12 =sum(min(H1,H2));
intersection_13 =sum(min(H1,H3));

Match = [ sum(min(H1,H2))/sum(H2)  sum(min(H1,H3))/sum(H3) ]



% ----------  for gray level image ------------ %
[nlin ncol]=size(rgb2gray(img1));
npixels_1 = nlin*ncol;
[nlin ncol]=size(rgb2gray(img2));
npixels_2 = nlin*ncol;
[nlin ncol]=size(rgb2gray(img3));
npixels_3 = nlin*ncol;

H1_g = imhist(rgb2gray(img1));
H2_g = imhist(rgb2gray(img2));
H3_g = imhist(rgb2gray(img3));

d12_g = sum(abs(H1_g-H2_g))/length(H1_g);
d13_g = sum(abs(H1_g-H3_g))/length(H1_g);

Distances = [d12_g d13_g]

intersection_g12 =sum(min(H1_g,H2_g));
intersection_g13 =sum(min(H1_g,H3_g));

Intersections= [ intersection_g12 intersection_g13 ];
matching_g12 = intersection_g12/sum(H2_g);
matching_g13 = intersection_g13/sum(H3_g);

Matches = [ matching_g12 matching_g13]





