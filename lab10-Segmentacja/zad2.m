clearvars;clc;close all;

global splitLimit stdLimit MRes segRes index;

umbrella = imread('umbrealla.png');
image = umbrella;

figure;
imshow(image, []);
title('original image');

%przestrze� HSV
imageHSV = rgb2hsv(image);

%tylko odcie�
imageH = double(imageHSV(:,:,1));

figure;
imshow(imageH, []);
title('H vector');

splitLimit = 4;
stdLimit = 0.05;
index = -1;
[y, x] = size(imageH);
segRes = zeros(y, x);
MRes = zeros(y, x);
colorThreshold = 5/255;
minAreaSize = 27;

split(imageH, 1, 1, x, y);


i = 0;
while i <= index
   IB = segRes == i;
   
   if any(IB(:))
       [yF, xF] = find(IB, 1, 'first');
       
       square = strel('square', 3);
       neighbors = imdilate(IB, square);
       diff = imabsdiff(neighbors, IB);
       pointMult = diff .* segRes;
       nonZeros = nonzeros(pointMult);
       uniqueV = unique(nonZeros);
       
       isJoined = 0;
       for neighbor = 1:numel(uniqueV)
           IBS = segRes == uniqueV(neighbor);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff < colorThreshold
               segRes(IBS) = i;
               isJoined = 1;
           end
       end
       if isJoined == 0
          i = i + 1;
       end
   else
       i = i + 1;
   end
end

figure;
imshow(segRes,[]);
title("final before filters")

U = unique(segRes);

for i = 1:numel(U)
    C = segRes == U(i);
    if sum(C) < minAreaSize
       segRes(C) = 0; 
    end
end

U = unique(segRes);

for i = 1:numel(U)
    C = segRes == U(i);
    segRes(C) = i;
end


finalRes = label2rgb(segRes);
figure;
imshow(finalRes);
title("final after filters")
