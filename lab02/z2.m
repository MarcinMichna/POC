clearvars; close all; clc;

I = imread("clock.bmp");
%I = imread("chessboard.bmp");
%I = imread("parrot.bmp");
imshow(I);


xReScale = 1.7;
yReScale = 1.7;

[YY,XX] = size(I);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY,nXX));


xStep = XX/nXX;
yStep = YY/nYY;

for ii = 0:nXX - 1
    for jj = 0:nYY - 1
        i1 = round(ii * xStep);
        j1 = round(jj * yStep);
        
        i2 = i1+1;
        j2 = j1+1;
        
        %1.7
        if(j1 > YY - 1)
            j1 = (YY - 1);
        end
        
        if(j2 > YY - 1)
            j2 = (YY - 1);
        end
        
        if(i1 > XX - 1)
            i1 = XXY - 1;
        end
        
        if(i2 > XX - 1)
            i2 = XX - 1;
        end
      
        
        fA = double(I(j1+1,i1+1));
        fB = double(I(j1+1,i2+1));
        fC = double(I(j2+1,i2+1));
        fD = double(I(j2+1,i1+1));
        
        in = (i2 - i1) / yReScale;
        jn = (j2 - j1) / xReScale;
        
        nI(jj+1,ii+1) = [(1 - in) in] * [fA fD ; fB fC] * [1-jn; jn] ;
        
    end
end


figure(2);
imshow(nI)