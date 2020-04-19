function [X_width, Y_width] = getWidthByImgIndices(imgH, imgW, PixelIdx)

if islogical(PixelIdx)
    PixelIdx = find(PixelIdx);
end

%%
[Y, X] = ind2sub([imgH, imgW], PixelIdx);
X_min = min(X);
X_max = max(X);
Y_min = min(Y);
Y_max = max(Y);
X_width = X_max - X_min + 1;
Y_width = Y_max - Y_min + 1;

end