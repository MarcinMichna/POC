close all; clearvars; clc;

mglawica = imread('mglawica_kolor.png');
image = mglawica;

load tablice_kwantyzacji.mat;
blockSize = [8 8];
c = 1;

imageYUV = rgb2ycbcr(image);

imageY = imageYUV(:,:,1);
imageU = imageYUV(:,:,2);
imageV = imageYUV(:,:,3);

kwantY = @(blok) round(blok ./ (c * Qy));
kwantC = @(blok) round(blok ./ (c * Qc));

yDTC = blkproc(imageY,blockSize,@dct2);
uDTC = blkproc(imageU,blockSize,@dct2);
vDCT = blkproc(imageV,blockSize,@dct2);

yJpeg = blkproc(yDTC,blockSize,kwantY);
uJpeg = blkproc(uDTC,blockSize,kwantC);
vJpeg = blkproc(vDCT,blockSize,kwantC);


% dekoder
dekwantY = @(blok) blok .* (c * Qy);
dekwantC = @(blok) blok .* (c * Qc);

Yimg = blkproc(yJpeg,blockSize,dekwantY);
Uimg = blkproc(uJpeg,blockSize,dekwantC);
Vimg = blkproc(vJpeg,blockSize,dekwantC);

yIDCT = blkproc(Yimg,blockSize,@idct2);
uIDCT = blkproc(Uimg,blockSize,@idct2);
vIDCT = blkproc(Vimg,blockSize,@idct2);


finalImage(:,:,1) = yIDCT;
finalImage(:,:,2) = uIDCT;
finalImage(:,:,3) = vIDCT;

finalImage = ycbcr2rgb(uint8(finalImage));

figure;
subplot(1,2,1);
imshow(image);
title("oryginalne")
subplot(1,2,2);
imshow(finalImage,[]);
title("po konwersji na jpeg i z powrotem")