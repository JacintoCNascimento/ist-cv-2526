
clear all, close all

% -------- EXEMPLO 1 -> Metodo 1 -------- %

path = 'D:\CVI\MATERIAL\Walking_pedestrian\'; frameIdComp = 4;
str  = ['%s%.' num2str(frameIdComp) 'd.%s'];
extName = 'png';
nFrame = 400;
figure; hold on, 

step = 4; i = 1;
for k = 1 : step : nFrame
    k
    img= imread(sprintf(str,path,k,'png'));   
    
    vid4D(:,:,:,i)=img;
    imshow(img); drawnow
    i = i+1;
end
bkg = median(vid4D,4);
figure,imshow(uint8(bkg));

% -------- EXEMPLO 1 -> Metodo 2 -------- %  

step = 4;
alfa = 0.01;  %experimentar para vários valores de alfa
Bkg = 0;
figure; hold on
for k = 1 : step : nFrame
    k
    img= imread(sprintf(str,path,k,'png'));   
    Y      = img;
    Bkg    = alfa * double(Y) + (1-alfa) * double(Bkg);
    imshow(uint8(Bkg)); drawnow
end


 
% ---------- EXEMPLO 2 -> pedestres e carros no campus IST  ------------ %
path = 'Ist\'; frameIdComp = 4;
str  = ['%s%.' num2str(frameIdComp) 'd.%s'];

nFrame = 548;
step = 4;

Bkg = 0; alfa = 0.05;
for k = 1 : 1 : nFrame/step
    k
    str1  = sprintf(str,path,k,'jpg');
    img   = imread(str1);
    % method 1 
    vid4D(:,:,:,k)=img;
    % ------ method 2
    Y = img;
    Bkg    = alfa * double(Y) + (1-alfa) * double(Bkg);
    imshow(uint8(Bkg)); drawnow
end
bkg_m = median(double(vid4D),4);
figure;imagesc(uint8(bkg_m));
figure;imagesc(uint8(Bkg));


% ----- EXEMPLO 3 -> sumulação de actividades na sala do ISR ------------ %
% --------------- DIZER QUE NECESSITAVAMOS DE MAIS IMAGENS -------------- %
% ----------------- PARA UMA ESTIOMAÇÂO ROBUSTA DE BKG ------------------ %

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
figure;imshow(uint8(bkg));






