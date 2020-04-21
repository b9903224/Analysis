function img_new = removeObjOnBorder(img, pixelNum)

if pixelNum <= 0
    return;
end

%%
[imgH, imgW] = size(img);
borderFilter = true(imgH, imgW);
borderFilter(1 + pixelNum : imgH - pixelNum, 1 + pixelNum : imgW - pixelNum) = false;
img_new = img;

%%
CC = bwconncomp(img);
for label = 1 : CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    if all(borderFilter(PixelIdx) == true)
        img_new(PixelIdx) = false;
    end
end

end