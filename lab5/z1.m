clc; close all; clearvars;

coins = imread("coins.png");
figure(1);
subplot(1,3,1);
imshow(coins);
subplot(1,3,2);
imhist(coins);

%1.3
bw = im2bw(coins,90/255);
subplot(1,3,3);
imshow(bw);

figure(2);
figura1 = imread("figura.png");
figura2 = imread("figura2.png");
figura3 = imread("figura3.png");
figura4 = imread("figura4.png");

subplot(4,2,1)
imshow(figura1)

subplot(4,2,2)
imhist(figura1)

subplot(4,2,3)
imshow(figura2)

subplot(4,2,4)
imhist(figura2)

subplot(4,2,5)
imshow(figura3)

subplot(4,2,6)
imhist(figura3)

subplot(4,2,7)
imshow(figura4)

subplot(4,2,8)
imhist(figura4)

%1.5

coins1 = coins;
coinsbw = im2bw(coins,graythresh(coins1));
figure(3);
imshow(coinsbw)


%1.7

coins2 = coins;

kitter = clusterKittler(coins2)/255;
yen =  entropyYen(coins2)/255;

figure(4);
subplot(2,2,1);
imshow(coins2)

subplot(2,2,2);
imhist(coins2)

subplot(2,2,3);
imshow(im2bw(coins2,kitter))
title(["Kitter", num2str(kitter)])

subplot(2,2,4);
imshow(im2bw(coins2,yen))
title(["Yen", num2str(yen)])

%1.8
rice = imread("rice.png");
tekst = imread("tekst.bmp");
obiety = imread("obiekty.bmp");
katalog = imread("katalog.bmp");

figure(5)
subplot(4,5,1)
imshow(rice)
subplot(4,5,2)
imhist(rice)
subplot(4,5,3)
imshow(im2bw(rice,clusterKittler(rice)/255))
title(["Kitter", num2str(clusterKittler(rice))])
subplot(4,5,4)
imshow(im2bw(rice,entropyYen(rice)/255))
title(["Yen", num2str(entropyYen(rice))])
subplot(4,5,5)
imshow(im2bw(rice,120/255))
title("Ręczne")

subplot(4,5,6)
imshow(tekst)
subplot(4,5,7)
imhist(tekst)
subplot(4,5,8)
imshow(im2bw(tekst,clusterKittler(tekst)/255))
title(["Kitter", num2str(clusterKittler(tekst))])
subplot(4,5,9)
imshow(im2bw(tekst,entropyYen(tekst)/255))
title(["Yen", num2str(entropyYen(tekst))])
subplot(4,5,10)
imshow(im2bw(tekst,180/255))
title("Ręczne")

subplot(4,5,11)
imshow(obiety)
subplot(4,5,12)
imhist(obiety)
subplot(4,5,13)
imshow(im2bw(obiety,clusterKittler(obiety)/255))
title(["Kitter", num2str(clusterKittler(obiety))])
subplot(4,5,14)
imshow(im2bw(obiety,entropyYen(obiety)/255))
title(["Yen", num2str(entropyYen(obiety))])
subplot(4,5,15)
imshow(im2bw(obiety,180/255))
title("Ręczne")

subplot(4,5,16)
imshow(katalog)
subplot(4,5,17)
imhist(katalog)
subplot(4,5,18)
imshow(im2bw(katalog,clusterKittler(katalog)/255))
title(["Kitter", num2str(clusterKittler(katalog))])
subplot(4,5,19)
imshow(im2bw(katalog,entropyYen(katalog)/255))
title(["Yen", num2str(entropyYen(katalog))])
subplot(4,5,20)
imshow(im2bw(katalog,150/255))
title("Ręczne")










