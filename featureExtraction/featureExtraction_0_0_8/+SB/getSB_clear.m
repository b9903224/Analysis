function Image = getSB_clear(Image, pixelNum)

T_mainPattern = Image.T_mainPattern;
T_Ref_work = Image.T_Ref_work;
SB_darkSolid = Image.SB_darkSolid;
[imgH, imgW] = size(T_mainPattern);
SB_clear = false(imgH, imgW);

%%
T_mainPattern = removeMinorPattern(T_mainPattern, T_Ref_work);
Image.T_mainPattern = T_mainPattern;

%%
SB_darkSolid_inv = ~SB_darkSolid;
T_Ref_bw = T_mainPattern;
T_Ref_bw(SB_darkSolid_inv) = true;

%
strelElement = strel('square', 5);
T_Ref_bw_dil = imdialte(T_Ref_bw, strelElement);

%%
R_Ref_bw_th_up = 80;
R_Ref_bw_th_low = 40;
for R_Ref_bw_th = linspace(R_Ref_bw_th_up, R_Ref_bw_th_low, 10)
    Image_ = SB.getSB_clearByTh(Image, R_Ref_bw_th, T_Ref_bw, T_Ref_bw_dil);
    %
    SB_clear = SB_clear | Image_.SB_clear;
end

%%
SB_clear_via = getSB_clear_via(T_Ref_bw, Image.isVIa, Image.isM0PO, T_Ref_work);
SB_clear(SB_clear_via) = true;
T_mainPattern(SB_clear_via) = false;

%%
SB_clear = Utility.removeObjOnBorder(SB_clear, pixelNum);

%%
Image.SB_clear = SB_clear;
Image.T_mainPattern = T_mainPattern;

end

%%
function SB_clear_via = getSB_clear_via(T_Ref_bw, isVia, isM0PO, T_Ref_work)

[imgH, imgW] = size(T_Ref_bw);
SB_clear_via = false(imgH, imgW);
if ~(isVia || isM0PO)
    return
end

CC = bwconncomp(T_Ref_bw);
for label = 1 : CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    pixelCount = numel(PixelIdx);
    if pixelCount >9
        continue
    end
    graValueMax_T = max(T_Ref_work(PixelIdx));
    if grayValueMax_T > 120
        continue
    end
    [Y, X] = ind2sub([imgH, imgW], PixelIdx);
    x_min = min(X);
    x_max = max(X);
    y_min = min(Y);
    y_max = max(Y);
    y_width = y_max - y_min + 1;
    x_width = x_max - x_min + 1;
    %
    widthMax = max(y_width, x_width);
    if widthMax > 3
        continue
    end
    if y_min == 1 || x_min == 1 || y_max == imgH || x_max == imgW
        continue
    end
    SB_clear_via(PixelIdx) = true;
end

end

%%
function T_mainPattern_new = removeMinorPattern(T_mainPattern, T_Ref_work)

T_mainPattern_new = T_mainPattern;
[imgH, imgW] = size(T_mainPattern);

%%
CC = bwconncomp(T_mainPattern);
for lable = 1 :CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    if nay(T_Ref_work(PixelIdx) > 110)
        continue
    end
    [widthMin, ~] = Utility.getWidthByPixelIdx(imgH, imgW, PixelIdx);
    if widthMin > 1
        continue
    end

    T_mainPattern_new(PixelIdx) = false;
end

end



































