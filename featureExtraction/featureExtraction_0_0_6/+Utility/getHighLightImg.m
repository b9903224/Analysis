function highLightImg = getHighLightImg(destImg, sourceImg, rgb)

if isa(sourceImg, 'logical')
    sourceImg = uint8(sourceImg) * 255;
end

%%
[~, ~, imgZ] = size(sourceImg);

if imgZ == 3
    temp = sourceImg(:, :, 1);
    temp2 = sourceImg(:, :, 2);
    temp3 = sourceImg(:, :, 3);
else
    temp = sourceImg;
    temp2 = sourceImg;
    temp3 = sourceImg;
end

temp(destImg) = rgb(1);
temp2(destImg) = rgb(2);
temp3(destImg) = rgb(3);

%%
highLightImg = cat(3, temp, temp2, temp3);

end