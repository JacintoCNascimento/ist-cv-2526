
clear all, close all

One  = ones(30);
Zero = zeros(30);

Line = [  One Zero One Zero One Zero ];

Chess  = [Line; ~Line; Line; ~Line];

figure; 
subplot(3,2,1);imagesc(Chess); colormap gray; hold on
plot([1 180],[80 80],'r','linewidth',2);
subplot(3,2,2);
plot(Chess(80,:),'b-','linewidth',2);

[L C] = size(Chess);
Chess_noise = Chess + 0.2*rand(L,C);

subplot(3,2,3);imagesc(Chess_noise); colormap gray; hold on
plot([1 180],[80 80],'r','linewidth',2);
subplot(3,2,4);plot(Chess_noise(80,:),'b-','linewidth',2);

Chess_clean = medfilt2(Chess_noise);
subplot(3,2,5);imagesc(Chess_clean); colormap gray; hold on
plot([1 180],[80 80],'r','linewidth',2);
subplot(3,2,6); plot(Chess_clean(80,:),'b-','linewidth',2);



   