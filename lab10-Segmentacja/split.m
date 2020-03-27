function split(image, xStart, yStart, xEend, yEnd)
    global splitLimit stdLimit MRes segRes index;
    
    subImg = image(yStart:yEnd,xStart:xEend);
    meanV = mean(subImg(:));
    stdV = std(subImg(:));
    
    if (stdV < stdLimit) || ((xEend - xStart) <= splitLimit)
        index=index + 1;
        segRes(yStart:yEnd, xStart:xEend) = index;
        MRes(yStart:yEnd, xStart:xEend) = meanV;
    else
        newX = floor((xStart + xEend) / 2);
        newY = floor((yStart + yEnd) / 2);
        
        split(image, xStart, yStart, newX, newY);
        split(image, newX + 1, yStart, xEend, newY);
        split(image, newX + 1, newY + 1, xEend, yEnd);
        split(image, xStart, newY + 1, newX, yEnd);
    end
    
end

