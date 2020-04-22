
% pass

function Image = getDiffImage(Image)

hasPattern = Image.hasPattern;
laserTechVer = Image.laserTechVer;
cropImageDarkPart = Image.cropImageDarkPart;
WorkImg = Image.WorkImg;

%%
cropImageDarkPart_dil = imdilate(cropImageDarkPart, strel('square', 5));
Image = ALignDiff.getFlatByDir(Image);

%%
if hasPattern
    if strcmp(laserTechVer, '7_series')
        searchRange = 6;
    elseif strcmp(laserTechVer, '8_series')
        searchRange = 4;
    end
else
    searchRange = 0;
end
removeRange = 6;
diff = getDiffCoarse(Image, searchRange, removeRange, cropImageDarkPart_dil);

%%
if hasPattern
    removeRange = 3;
    [diff_adv0, diff_adv, diff_adv2] = getDiffImage_noShift(Image, diff, removeRange, cropImageDarkPart_dil, 'TR');
%     if strcmp(laserTechVer, '7
else
end

end























