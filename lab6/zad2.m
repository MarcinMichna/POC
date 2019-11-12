close all; clc; clearvars;

lenaSzum = imread('lenaSzum.bmp');

figure(1)
subplot(3,1,1)
imshow(lenaSzum);
title("oryginał")

subplot(3,1,2);
imshow(medfilt2(lenaSzum));
title("medilt2")

subplot(3,1,3);
imshow(imabsdiff(lenaSzum, medfilt2(lenaSzum)))
title("medilt2 diff")

post = medfilt2(lenaSzum);
for i=0:10
   post = medfilt2(post);
end

figure(2)
subplot(1,2,1)
imshow(lenaSzum)
title("oryginal")

subplot(1,2,2)
imshow(post)
title("posteryzacja")
