clearvars; close all; clc;

load funkcjeLUT;

%1.4
%figure(1);
%plot(kwadratowa);

%1.5
lena = imread("lena.bmp");
jet = imread("jet.bmp");

%figure(2);
%imshow(lena);

%figure(3);
%imshow(jet);

figure(4);
LUT(lena,kwadratowa);

figure(5);
LUT(lena,log);

figure(6);
LUT(lena,odwlog);

figure(7);
LUT(lena,odwrotna);

figure(8);
LUT(lena,pierwiastkowa);

figure(9);
LUT(lena,pila);

figure(10);
LUT(lena,wykladnicza);