
clear all, close all

% para vários sigmas vão-se obtendo diferentes maps 

example = 8; Flg_RGB = 0; mode = 2;

switch example

    case 1 % Example 1 - RGB
        imgO  = imread('airplane.jpg');
        img = imgO;
    case 2 % Example 1 - RGB
        %Flg_RGB = 1;
        imgO  = imread('test1.jpg');
        img = imgO;
        img   = double(rgb2gray(imgO)); % convert to gray-scale
    case 3
        imgO  = imread('1002_webImage.jpg'); %pedra
        img   = double(rgb2gray(imgO)); % convert to gray-scale
    case 4
        imgO  = imread('1006_webImage.jpg'); %folha
        img   = double(rgb2gray(imgO)); % convert to gray-scale
    case 5
        imgO  = imread('1017_webImage.jpg'); %pedras
        img   = double(rgb2gray(imgO)); % convert to gray-scale
    case 6
        imgO  = imread('1199_webImage.jpg'); %catarata
        img   = double(rgb2gray(imgO)); % convert to gray-scale
        hsize = [9 9];                  % filter size
        sigma = 2;                      % gaussian std
        k     = 50;                    % larger k => larger regions
    case 7
        imgO  = imread('1868_webImage.jpg'); %monte
        img   = double(rgb2gray(imgO)); % convert to gray-scale
    case 8
        imgO  = imread('a0033.tif');
        img   = double(imgO);
end


range = [20:-0.5:0.01];
figure;
for sigma = range
    if Flg_RGB
        if example == 2
            bw1 = edge(imgO(:,:,1),'canny',[],sigma);
            bw2 = edge(imgO(:,:,2),'canny',[],sigma);
            bw3 = edge(imgO(:,:,3),'canny',[],sigma);
            if mode == 1
                subplot(2,2,1);imshow(imgO)
                subplot(2,2,2);imshow(bw1);
                subplot(2,2,3);imshow(bw2);
                subplot(2,2,4);imshow(bw3); drawnow
            end
            if mode == 2
                bw = zeros(size(imgO,1),size(imgO,2),3);
                bw(:,:,1)=bw1;
                bw(:,:,2)=bw2;
                bw(:,:,3)=bw3;
                subplot(1,2,1);imshow(imgO)
                subplot(1,2,2);imshow(bw); drawnow
            end
            pause(0.5)
        end
    else
        bw = edge(img,'canny',[],sigma);
        subplot(1,2,1);imshow(imgO)
        subplot(1,2,2);imshow(bw); drawnow
        pause%(0.5)
    end
end
bwI = edge(img,'canny',[],range(1));
figure;
subplot(1,2,1);imshow(bwI)
subplot(1,2,2);imshow(bw)



