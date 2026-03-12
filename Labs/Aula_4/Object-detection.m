
clear all, close all

imgbk = imread('database\\ped7c0000.tif');

thr     = 40;       minArea   = 1;
baseNum = 1350;     seqLength = 100;

se = strel('disk',2);

figure; hold on
for i=0:seqLength
    imgfr = imread(sprintf('database\\ped7c%.4d.tif',baseNum+i));
         
    imgdif = (abs(double(imgbk(:,:,1))-double(imgfr(:,:,1)))>thr) | ...
        (abs(double(imgbk(:,:,2))-double(imgfr(:,:,2)))>thr) | ...
        (abs(double(imgbk(:,:,3))-double(imgfr(:,:,3)))>thr);

    bw2 = imclose(imgdif,se);
    bw3 = imerode(imgdif,se);

    [lb num]=bwlabel(bw2);
    regionProps = regionprops(lb,'area','FilledImage','Centroid');
    inds = find([regionProps.Area]>minArea);
    
    regnum = length(inds);
    subplot(2,2,1);imshow(imgfr);
    subplot(2,2,2);imshow(imgdif);
    subplot(2,2,3);imshow(bw2); 
    subplot(2,2,4);imshow(bw3);
    
    if regnum
        for j=1:regnum
            [lin col]= find(lb == inds(j));
            upLPoint = min([lin col]);
            dWindow  = max([lin col]) - upLPoint + 1;
            
            rectangle('Position',[fliplr(upLPoint) fliplr(dWindow)],'EdgeColor',[1 1 0],...
                'linewidth',2);
        end
    end
    drawnow
end

