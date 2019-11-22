close all; clearvars; clc;

%% 2.2
fingerprint = imread('fingerprint.bmp');

finger2 = bwmorph(fingerprint, 'thin', 1);
finger3 = bwmorph(fingerprint, 'thin', 2);
finger4 = bwmorph(fingerprint, 'thin', Inf);

figure; 
subplot(2,2,1)
imshow(fingerprint)
title("oryginal")
subplot(2,2,2)
imshow(finger2)
title("bwmorph 1")
subplot(2,2,3)
imshow(finger3)
title("bwmorph 2")
subplot(2,2,4)
imshow(finger4)
title("bwmorph inf")

%% 2.3

kosc = imread("kosc.bmp");
kosc1 =bwmorph(kosc, 'skel', Inf);

figure; 
subplot(2,1,1)
imshow(kosc)
title("oryginal")
subplot(2,1,2)
imshow(kosc1)
title("bwmorph skel")

%% 2.5

text = imread('text.bmp');
SE = ones(51, 1);
text1 = imopen(text,SE);

marker = imerode(text, SE);
text2 = imreconstruct(marker, text);

subplot(2,2,1);
imshow(text);
title('original');
subplot(2,2,2);
imshow(text1);
title('opened');
subplot(2,2,3);
imshow(text2);
title('reconstructed');

%% 2.6

figure;
subplot(2,1,1)
imshow(text)
title("oryginal")
subplot(2,1,2)
imshow(imfill(text,'holes'));
title("wype³nianie dziur")

%% 2.7

figure;
subplot(2,1,1)
imshow(text)
title("oryginal")
subplot(2,1,2)
imshow(imclearborder(text));
title("czyszczenie brzegu")