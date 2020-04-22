function Image = getSB_darkSolid(Image, pixelNum)

T_Ref_work = Image.T_Ref_work;
R_Ref_work = Image.R_Ref_work;
T_Ref_work_bw = Image.T_Ref_work_bw;
cropImageDarkPart = Image.cropImageDarkPart;
isVia = Image.isVia;
[imgH, imgW] = size(T_Ref_work);

%%
T_mainPattern = T_Ref_work_bw;
SB_darkSolid = true(imgH, imgW);

%%
% tic
T_Ref_bw_th_up = 140/255;
T_Ref_bw_th_low = 100/255;
for T_Ref_bw_th = linspace(T_Ref_bw_th_up, T_Ref_bw_th_low, 9)
    Image_ =...
        SB.getSB_darkSolidByTh(Image, T_Ref_bw_th, R_Ref_work, corpImageDarkPart);
%     figure, imshow(Image_.SB_darkSolid);
    SB_darkSolid = ~(~SB_darkSolid | ~Image_.SB_darkSolid);
end
% toc

%%
% tic
SB_darkSolid = removeFalseSSB_onThinLine(SB_darkSolid, T_Ref_work, isVia);
% toc

%%
SB_darkSolid = ~Utility.removeObjOnBorder(~SB_darkSolid, pixelNum);

%%
T_mainPattern(~SB_darkSolid) = true;

%%
Image.SB_darkSolid = SB_darkSolid;
Image.T_mainPattern = T_mainPattern;

%%
% 
% 
%
% 
% 

end

%%
function SB_darkSolid = removeFalseSSB_onThinLine(SB_darkSolid, T_Ref_work, isVia)

[imgH, imgW] = size(SB_darkSolid);

%%
T_Ref_bright = T_Ref_work > 150;
Sb_darkSOlid_inv = ~SB_darkSolid;

%%
dilPixel = 2;
strelElement = strel('square', dilPixel *2 + 1);
CC = bwconncomp(SB_darkSolid_inv, 4);

%%
CC_NumObjects_limit = 600;

if (~isVIa && CC.NumObjects > CC_NumObjects_limit) || (isVia && CC.NumObjects > 800)
    SB_darkSolid = true(imgH, imgW);
    return;
end

for label = 1 : CC.NumObjects
    PixelIdx = CC.PixelIdxList{label};
    [Y, X] = ind2sub([imgH, imgW], PixelIdx);
    x_min = min(X);
    x_max = max(X);
    y_min = min(Y);
    y_max = max(Y);
    x_range = max(x_min - dilPixel, 1) : min(x_max + dilPixel, imgW);
    y_range = max(y_min - dilPixel, 1) : min(y_max + dilPixel, imgH);
    SB_darkSolid_inv_part = false(imgH, imgW);
    SB_darkSolid_inv_part(PixelIdx) = true;
    SB_darkSolid_inv_part = SB_darkSolid_inv_part(y_range, x_range);
    SB_darkSolid_inv_part_dil = imdilate(Sb_darkSolid_inv_part, strelElement);
    SB_darkSolid_inv_part_dil(SB_darkSolid_inv_part) = false;
    T_Ref_bright_part = T_Ref_bright(y_range, x_range);
    if sum(T_Ref_bright_part(SB_darkSolid_inv_part_dil)) < 10
        SB_darkSolid(PixelIdx) = true;
        continue
    end
    
    grayValueAry = T_Ref_work(PixelIdx);
    grayValueMin = min(grayValueAry);
    if grayValueMin < 30
        SB_darkSolid(PixelIdx) = true;
        continue
    end
end
end





































