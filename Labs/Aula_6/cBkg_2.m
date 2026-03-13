
clear all, close all

path = 'D:\CVI\MATERIAL\Coffe\'; frameIdComp = 4;
str  = ['%s%.' num2str(frameIdComp) 'd.%s'];

nFrame = 1048; 
step = 1;
alfa = 0.05;
Bkg  = 0;
figure;hold on
for k = 1 : 1 : nFrame/step
    k 
    str1  = sprintf(str,path,k,'jpg');
    img   = imread(str1);
    
    % ------ method 1
    vid4D(:,:,:,k)=img;
    %imagesc(uint8(img)); drawnow
    % ------ method 2
    Y = img;
    Bkg    = alfa * double(Y) + (1-alfa) * double(Bkg);
    imshow(uint8(Bkg)); drawnow
    
    %pause(.2)
    disp('');
end
bkg = median(vid4D,4);
figure;imagesc(uint8(bkg));
figure;imshow(uint8(Bkg));

