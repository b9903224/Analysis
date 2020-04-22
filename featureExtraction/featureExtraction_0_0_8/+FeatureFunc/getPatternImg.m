function Image = getPatternImg(Image)

Image = getT_Ref_work_bw(Image);

%%
pixelNum = 1;
Image = SB.getSB_darkSolid(Image, pixelNum);
Image = SB.getSB_clear(Image, pixelNum);

Image = SB.getSSBLineTail(Image);

Image = SB.getSB_show(Image);

Image = FeatureParsing.getT_mainPattern(Image);

%%
Image = judgeHasPattern(Image);

end

%%
function Image = getT_Ref_work_bw(Image)

T_Ref_work = Image.T_Ref_work;

%%
T_Ref_bw_th = 90/255;
T_Ref_work_bw = im2bw(T_Ref_work, T_Ref_bw_th);

%%
Image.T_Ref_bw_th = T_Ref_bw_th;
Image.T_Ref_work_bw = T_Ref_work_bw;

end

%%
function Image = judgeHasPattern(Image)
hasPattern = true;
T_mainPattern = Image.T_mainPattern;
SB_darkSolid = Image.SB_darkSolid;
SB_clear = Image.SB_clear;

if (all(T_mainPattern(:) == true) || all(T_mainPattern(:) == false)) &&...
        all(SB_darkSolid(:) == true) && all(SB_clear(:) == false)
    hasPattern = false;
end
Image.hasPattern = hasPattern;

end


























