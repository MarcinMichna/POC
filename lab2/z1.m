clearvars; close all; clc;

%1.2
I = imread("clock.bmp");
%I = imread("chessboard.bmp");
%I = imread("parrot.bmp");
imshow(I);

%1.3

xReScale = 1.5;
yReScale = 1.5;

%1.4
[YY,XX] = size(I);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

%1.5-7

xStep = XX/nXX;
yStep = YY/nYY;

for ii = 0:nXX - 1
    for jj = 0:nYY - 1
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        %1.7
        if(j > YY - 1)
            j = (YY - 1);
        end
        
        if(i > XX - 1)
            i = XX - 1;
        end
      
        %1.6
        nI(jj+1,ii+1) = I(j+1,i+1);

    end
end


figure(2);
imshow(nI)