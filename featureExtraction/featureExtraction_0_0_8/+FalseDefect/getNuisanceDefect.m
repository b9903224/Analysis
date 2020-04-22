function Image = getNuisanceDefect(Image)

T_diff_plus2 = Image.T_diff_plus2;
T_diff_minus2 = Image.T_diff_minus2;
R_diff_plus2 = Image.R_diff_plus2;
R_diff_minus2 = Image.R_diff_minus2;

imgH = Image.imgH;
imgW = Image.imgW;

%%
temp = false(imgH, imgW);
nuisanceDefect_T_plus = temp;
nuisanceDefect_T_minus = tmep;
nuisanceDefect_R_plus = temp;
nuisanceDefect_R_minus = tmep;

%%
% [T_diff_plus2, nuisanceDefect_T_plus] = removeNuisanceDefect(T_diff_plus2, nuisanceDefect_T_plus);
% [T_diff_minus2, nuisanceDefect_T_minus] = removeNuisanceDefect(T_diff_minus2, nuisanceDefect_T_minus);
% [R_diff_plus2, nuisanceDefect_R_plus] = removeNuisanceDefect(T_diff_plus2, nuisanceDefect_T_plus);
% [R_diff_minus2, nuisanceDefect_T_minus] = removeNuisanceDefect(T_diff_minus2, nuisanceDefect_T_minus);

[nuisanceDefect_T_show, nuisanceDefect_R_show] =...
    getDefectShow(nuisanceDefect_T_plus,nuisanceDefect_T_minus,nuisanceDefect_R_plus,nuisanceDefect_R_minus,Image);

%%
Image.T_diff_plus2 = T_diff_plus2;
Image.T_diff_minus2 = T_diff_minus2;
Image.R_diff_plus2 = R_diff_plus2;
Image.R_diff_minus2 = R_diff_minus2;

Image.nuisanceDefect_T_show = nuisanceDefect_T_show;
Image.nuisanceDefect_R_show = nuisanceDefect_R_show;

end

%%
function [nuisanceDefect_T_show, nuisanceDefect_R_show] = getDefectShow(nuisanceDefect_T_plus,nuisanceDefect_T_minus,nuisanceDefect_R_plus,nuisanceDefect_R_minus,Image)

T_diff_true = Image.T_diff_true;
R_diff_true = Image.R_diff_true;

nuisanceDefect_T_show = T_diff_true;
nuisanceDefect_R_show = R_diff_true;

%%
if ~Image.isTest
    return
end

nuisanceDefect_T_show = Utility.getHighLightImg(nuisanceDefect_T_plus, nuisanceDefect_T_show, [0,255,0]);
nuisanceDefect_T_show = Utility.getHighLightImg(nuisanceDefect_T_minus, nuisanceDefect_T_show, [255,0,0]);

nuisanceDefect_R_show = Utility.getHighLightImg(nuisanceDefect_R_plus, nuisanceDefect_R_show, [0,255,0]);
nuisanceDefect_R_show = Utility.getHighLightImg(nuisanceDefect_R_minus, nuisanceDefect_R_show, [255,0,0]);

end

%%
function [T_diff_plus2, nuisanceDefect_T_plus] = removeNuisanceDefect(T_diff_plus2, nuisanceDefect_T_plus)

[imgH, imgW] = size(T_diff_plus2);

%%
CC = bwconncomp(T_diff_plus2);
for label = 1 : CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    pixelCount = numel(PixelIdx);
    if pixelCount <4
        T_diff_plus2(pixelIdx) = false;
        nuisanceDefect_T_plus(PixelIdx) = true;
        continue
    end
    [X_width, Y_width] = Utility.getWidthByImgIndices(imgH, imgW, PixelIdx);
    widthMin = min(X_width, Y_width);
    if widthMin == 1
        T_diff_plus2(pixelIdx) = false;
        nuisanceDefect_T_plus(PixelIdx) = true;
        continue
    end
end

end


































