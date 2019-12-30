clc; close all; clearvars;

okno = 30;
k = 0.4;

image1 = imread("rice.png");
[X,Y] = size(image1);

figure(1)

subplot(1,2,1)
imshow(image1)


for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,floor(okno/2),image1,X,Y);
        if image1(i,j) > mean
            image1(i,j) = 255;
        else
            image1(i,j) = 0;
        end
        
    end
end

subplot(1,2,2)
imshow(image1)

image2 = imread("katalog.bmp");
[X,Y] = size(image2);
title("binaryzacja lokalna zwykła")

figure(2)

subplot(1,2,1)
imshow(image2)


for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,floor(okno/2),image2,X,Y);
        if image2(i,j) > mean
            image2(i,j) = 255;
        else
            image2(i,j) = 0;
        end
        
    end
end

subplot(1,2,2)
imshow(image2)
title("binaryzacja lokalna zwykła")

%%Sauvoli

image3 = imread("rice.png");
[X,Y] = size(image3);

figure(3)

subplot(1,2,1)
imshow(image3)


for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,floor(okno/2),image3,X,Y);
        s = stddevLT(i,j,floor(okno/2),image3,mean,X,Y);
        
        t = mean * (1 + k * (s/128 - 1));
        if image3(i,j) > t
            image3(i,j) = 255;
        else
            image3(i,j) = 0;
        end
        
    end
end

subplot(1,2,2)
imshow(image3)
title("binaryzacja lokalna Sauvol'i")
%


image4 = imread("katalog.bmp");
[X,Y] = size(image4);

figure(4)

subplot(1,2,1)
imshow(image4)


for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,floor(okno/2),image4,X,Y);
        s = stddevLT(i,j,floor(okno/2),image4,mean,X,Y);
        
        t = mean * (1 + k * (s/128 - 1));
        if image4(i,j) > t
            image4(i,j) = 255;
        else
            image4(i,j) = 0;
        end
        
    end
end

subplot(1,2,2)
imshow(image4)
title("binaryzacja lokalna Sauvol'i")






