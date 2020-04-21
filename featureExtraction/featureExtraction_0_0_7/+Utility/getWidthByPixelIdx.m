function [widthMin, widthMax] = getWidthByPixelIdx(imgH, imgW, PixelIdx)

if islogical(PixelIdx)
    PixelIdx = find(PixelIdx);
end
[Y, X] = ind2sub([imgH, imgW], PixelIdx);

%%
x_min = min(X);
x_max = max(X);
y_min = min(Y);
y_max = max(Y);
x_range = x_max - x_min + 1;
y_range = y_max - y_min + 1;

widthMin = min(x_range, y_range);
widthMax = max(x_range, y_range);

end