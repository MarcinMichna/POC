clearvars; close all; clc;

lena = imread("lena.bmp");
jet = imread("jet.bmp");

%2.2
%dodawanie
figure(1)
imshow(imadd(lena,jet,'uint16'),[]);
title("dodawanie");

%2.4
figure(2)
imshow(imlincomb(1,lena,1.2,jet),[]);
title("lincomb1");

figure(3)
imshow(imlincomb(1.2,lena,1,jet),[]);
title("lincomb2");

%2.5
figure(4)
imshow(imsubtract(int16(lena),int16(jet)),[]);
title("odejmowanie");

%2.7
figure(5)
imshow(imabsdiff(lena,jet),[]);
title("wart bezwzgl");

%2.8
figure(6)
mul = immultiply(int16(lena), int16(jet));
imshow(mul,[]);
title("mnozenie");

figure(7)
mul2 = immultiply(int16(lena), 1.2);
imshow(mul2,[]);
title("mnozenie2");

mask = imread("kolo.bmp");
mask = boolean(mask);

figure(8)
imshow(immultiply(int16(lena), mask),[]);
title("mnozenie maska");

%2.11
figure(9)
imshow(imcomplement(lena));
title("negatyw")