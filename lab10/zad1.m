clearvars;clc;close all;

knee = imread('knee.png');
image = knee;

figure;
imshow(image);
[y, x] = ginput(1);
x = floor(x);
y = floor(y);

image = double(image);

[ySize, xSize] = size(image);

visited = zeros(xSize, ySize);
segmented = zeros(xSize, ySize);

stack = zeros(10000, 2);
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack(iStack, 1:2) = [x, y];


threshold = 30;


mV = 0;
nS = 0;
while iStack > 0
    cx = stack(iStack, 1);
    cy = stack(iStack, 2);
    iStack = iStack-1;
    nS = nS + 1;
    mV = (mV * (nS - 1) + image(cx, cy)) / nS;
    
    if cx > 1 && cx < xSize && cy > 1 && cy < ySize
        for ix = cx - 1 : cx + 1
            for iy = cy - 1 : cy + 1
                if cx == ix && cy == iy
                    segmented(ix,iy) = image(ix,iy);
                elseif visited(ix,iy) == 0 && (abs(image(ix,iy) - mV) < threshold)
                    iStack=iStack+1;
                    stack(iStack, :) = [ix, iy];
                    segmented(ix,iy) = image(ix,iy);
                end
                visited(ix,iy) = 1;
            end
        end
    end
end

figure;
imshow(segmented,[]);

