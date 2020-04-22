function Image = getT_mainPattern(Image)

T_Ref_work = Image.T_Ref_work;
T_Ref_bw_th = Image.T_Ref_bw_th;
T_mainPattern = Image.T_mainPattern;
SB_darkSolid = Image.SB_darkSolid;
SB_clear = Image.SB_clear;

%%
T_mainPattern_ori = T_mainPattern;
StrelElement = strel('square', 3);
T_Ref_bw_th_low = T_Ref_bw_th - 5/255; % assume 85
SB_darkSolid_inv = ~SB_darkSolid;
SB_darkSolid_inv_dil = imdilate(SB_darkSolid_inv, StrelElement);
SB_clear_dil = imdilate(SB_clear, StrelElement);

T_Ref_work_bw_low = im2bw(T_Ref_work, T_Ref_bw_th_low);
T_mainPattern_ori_dil = imdilate(T_mainPattern_ori, StrelElement);
T_Ref_work_bw_low(SB_darkSolid_inv_dil) = true;
T_Ref_work_bw_low(SB_clear_dil) = false;

T_mainPattern_low_edge = T_mainPattern_ori_dil & xor(T_Ref_work_bw_low, T_mainPattern_ori(;
T_mainPattern(T_mainPattern_low_edge) = true;

%%
T_mainPattern_fat_show =...
    getT_mainPattern_fat_show(T_Ref_work, T_mainPattern, T_mainPattern_low_edge);

%%
Image.T_mainPattern = T_mainPatten;
Image.T_mainPattern_fat_show = T_mainPattern_fat_show;

end

%%
function T_mainPattern_fat_show =...
    getT_mainPattern_fat_show(T_Ref_true, T_mainPattern, T_mainPattern_low_edge)

temp = T_Ref_true;
temp2 = T_Ref_true;
temp3 = T_Ref_true;

alphaRatio_white = 0.7;
alphaRatio_dark = 0.9;

temp(T_mainPattern) = 255;
temp2(T_mainPattern) = 255;
temp3(T_mainPattern) = temp3(T_mainPattern) *alphaRatio_dark;

temp(T_mainPattern_low_edge) = 150;
temp2(T_mainPattern_low_edge) = 150;
temp3(T_mainPattern_low_edge) = temp3(T_mainPattern_low_edge) * alphaRatio_white;

%%
T_mainPattern_fat_show = cat(3, temp, temp2, temp3);

end


























