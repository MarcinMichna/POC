close all; clearvars; clc;

%% 3.2

ferrari = imread('ferrari.bmp');
SE = strel('square', 3);
eroded = imerode(ferrari, SE);
dilatated = imdilate(ferrari, SE);
erodedDiff = ferrari - eroded;
dilatatedDiff = ferrari - dilatated;
opened = imopen(ferrari, SE);
closed = imclose(ferrari, SE);
tophat = imtophat(ferrari, SE);
bothat = imbothat(ferrari, SE);

figure;
subplot(3,3,1);
imshow(ferrari);
title('original');
subplot(3,3,2);
imshow(eroded);
title('eroded');
subplot(3,3,3);
imshow(dilatated);
title('dilatated');
subplot(3,3,4);
imshow(erodedDiff);
title('erodedDiff');
subplot(3,3,5);
imshow(dilatatedDiff);
title('dilatatedDiff');
subplot(3,3,6);
imshow(closed);
title('closed');
subplot(3,3,7);
imshow(opened);
title('opened');
subplot(3,3,8);
imshow(tophat);
title('tophat');
subplot(3,3,9);
imshow(bothat);
title('bothat');

%% 3.5

rice = imread('rice.png');

SE = strel('disk', 10);
subplot(1,3,1);
imshow(rice);
title('original');
subplot(1,3,2);
imshow(imtophat(rice, SE));
title('tophat disk');
subplot(1,3,3);
imshow(imbothat(rice, SE));
title('bothat disk');