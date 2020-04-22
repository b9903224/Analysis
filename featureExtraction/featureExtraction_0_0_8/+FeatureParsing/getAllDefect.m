function Image = getAllDefect(Image)

T_diff_plus = Image.T_diff_plus;
T_diff_minus = Image.T_diff_minus;
R_diff_plus = Image.R_diff_plus;
R_diff_minus = Image.R_diff_minus;

T_diff_plus2 = Image.T_diff_plus2;
T_diff_minus2 = Image.T_diff_minus2;
R_diff_plus2 = Image.R_diff_plus2;
R_diff_minus2 = Image.R_diff_minus2;

T_mainPattern = Image.T_mainPattern;
T_Ref_work = Image.T_Ref_work;
T_Test_work = Image.T_Test_work;
R_Ref_work = Image.R_Ref_work;
R_Test_work = Image.R_Test_work;

T_diff_true = Image.T_diff_true;
R_diff_true = Image.R_diff_true;

T_diff_true_scaled = Image.T_diff_true_scaled;
R_diff_true_scaled = Image.R_diff_true_scaled;

diff_adv2 = Image.diff_adv2;
dx_final_T_f2 = diff_adv2.dx_final_T;
dy_final_T_f2 = diff_adv2.dy_final_T;
dx_final_R_f2 = diff_adv2.dx_final_R;
dy_final_R_f2 = diff_adv2.dy_final_R;

%%
allDefect = T_diff_plus | T_diff_minus | R_diff_plus | R_diff_minus;
allDefect_show = getDefectOn_T_Ref_bw_show(allDefect, T_mainPattern);
allDefect_show2 = getDefectOn_T_Ref_show(allDefect, T_mainPattern, T_Ref_work);

allDefect2 = T_diff_plus2 | T_diff_minus2 | R_diff_plus2 | R_diff_minus2;
allDefect2_show = getDefectOn_T_Ref_bw_show(allDefect2, T_mainPattern);
allDefect2_show2 = getDefectOn_T_Ref_show(allDefect2, T_mainPattern, T_Ref_work);

%%
allDefect_T2 = T_diff_plus2 | T_diff_minus2;
allDefect_R2 = R_diff_plus2 | R_diff_minus2;

%%
T_Ref_show = Utility.getDefect_show(allDefect_T2, T_Ref_work, [255,0,0], 5);
% T_Test_show = Utility.getDefect_show(allDefect_T2, T_Test_work, [255,0,0], 5);
T_diff_true_show = Utility.getDefect_show(allDefect_T2, T_diff_true, [255,0,0], 5);
T_diff_true_scaled_show = Utility.getDefect_show(allDefect_T2, T_diff_true_scaled, [255,0,0], 5);

R_Ref_show = Utility.getDefect_show(allDefect_R2, R_Ref_work, [255,0,0], 5);
% R_Test_show = Utility.getDefect_show(allDefect_R2, R_Test_work, [255,0,0], 5);
R_diff_true_show = Utility.getDefect_show(allDefect_R2, R_diff_true, [255,0,0], 5);
R_diff_true_scaled_show = Utility.getDefect_show(allDefect_R2, R_diff_true_scaled, [255,0,0], 5);

%%
T_Test_show = getDefectShowWidthShift(allDefect_T2, T_Test_work, [255,0,0], 5, dy_final_T_f2, dx_final_T_f2);
R_Test_show = getDefectShowWidthShift(allDefect_R2, R_Test_work, [255,0,0], 5, dy_final_R_f2, dx_final_R_f2);

%%
T_defectOnW = allDefect_T2 & T_mainPattern;
R_defectOnW = allDefect_R2 & T_mainPattern;
TRdefectOnW = T_defectOnW | R_defectOnW;

%%
% tic
Image = getToolDefectShow(Image);
% toc

%%
Image.allDefect = allDefect;
Image.allDefect_show = allDefect_show;
Image.allDefect_show2 = allDefect_show2;
Image.allDefect2 = allDefect2;
Image.allDefect2_show = allDefect2_show;
Image.allDefect2_show2 = allDefect2_show2;

Image.allDefect_T2 = allDefect_T2;
Image.allDefect_R2 = allDefect_R2;

Image.T_defectOnW = T_defectOnW;
Image.R_defectOnW = R_defectOnW;
Image.TRdefectOnW = TRdefectOnW;

Image.T_Ref_show = T_Ref_show;
Image.T_Test_show = T_Test_show;
Image.T_diff_true_show = T_diff_true_show;
Image.T_diff_true_scaled_show = T_diff_true_scaled_show;

Image.R_Ref_show = R_Ref_show;
Image.R_Test_show = R_Test_show;
Image.R_diff_true_show = R_diff_true_show;
Image.R_diff_true_scaled_show = R_diff_true_scaled_show;

end

%%
function Image = getToolDefectShow(Image)

[T_Defect, T_Ref_tool_show, T_Test_tool_show, T_diff_true_tool_show, T_diff_true_scaled_tool_show] =...
    getToolDefectShow_TR(Image, 'T');
[R_Defect, R_Ref_tool_show, R_Test_tool_show, R_diff_true_tool_show, R_diff_true_scaled_tool_show] =...
    getToolDefectShow_TR(Image, 'R');

%%
ToolDefectShow = struct;

ToolDefectShow.T_Defect = T_Defect;
ToolDefectShow.R_Defect = R_Defect;

ToolDefectShow.T_Ref_tool_show = T_Ref_tool_show;
ToolDefectShow.R_Ref_tool_show = R_Ref_tool_show;
ToolDefectShow.T_Test_tool_show = T_Test_tool_show;
ToolDefectShow.R_Test_tool_show = R_Test_tool_show;
ToolDefectShow.T_diff_true_tool_show = T_diff_true_tool_show;
ToolDefectShow.R_diff_true_tool_show = R_diff_true_tool_show;
ToolDefectShow.T_diff_true_scaled_tool_show = T_diff_true_scaled_tool_show;
ToolDefectShow.R_diff_true_scaled_tool_show = R_diff_true_scaled_tool_show;

Image.ToolDefectShow = ToolDefectShow;

end

%%
function [T_Defect, T_Ref_tool_show, T_Test_tool_show, T_diff_true_tool_show, T_diff_true_scaled_tool_show] =...
    getToolDefectShow_TR(Image, lightType)

T_Ref = Image.(sprintf('%s_Ref', lightType));
T_Test = Image.(sprintf('%s_Test', lightType));

T_Defect = Image.(sprintf('%s_Defect', lightType));

T_diff_true = Image.(sprintf('%s_diff_true', lightType));

T_diff_true_scaled = Image.(sprintf('%s_diff_true_scaled', lightType));

imgH = Image.imgH;
imgW = Image.imgW;

%%
if isempty(T_Defect)
    noImageImg = DemoProd.getNoImageImg(imgH, imgW);
    T_Ref_tool_show = noImageImg;
    T_Test_tool_show = noImageImg;
    T_diff_true_tool_show = noImageImg;
    T_diff_true_scaled_tool_show = noImageImg;
    
    T_Defect = noImageImg;
    
    return
else
    T_Defect = T_Defect == 255;
end

%%
T_Defect_filter = imdilate(T_Defect, strel('square', 3));
T_Defect_filter(T_Defect) = false;

%%
rgb = [255,0,0];

T_Ref_tool_show = Utility.getHighLightImg(T_Defect_filter, T_Ref, rgb);
T_Test_tool_show = Utility.getHighLightImg(T_Defect_filter, T_Test, rgb);
T_diff_true_tool_show = Utility.getHighLightImg(T_Defect_filter, T_diff_true, rgb);
T_diff_true_scaled_tool_show = Utility.getHighLightImg(T_Defect_filter, T_diff_true_scaled, rgb);

end

%%
function defectOn_T_Ref_bw_show = getDefectOn_T_Ref_bw_show(allDefect, T_Ref_true_bw)

defectOn_white = allDefect & T_Ref_true_bw;
defectOn_dark = allDefect & ~T_Ref_true_bw;

%%
temp1 = uint8(T_Ref_true_bw) * 255;
temp2 = temp1;
temp3 = temp1;

temp1(defectOn_white) = 255;
temp1(defectOn_dark) = 0;
temp2(defectOn_dark) = 255;
temp2(defectOn_white) = 0;
temp3(defectOn_white) = 0;
temp3(defectOn_dark) = 0;

defectOn_T_Ref_bw_show = cat(3, temp1, temp2, temp3);

end

%%
function defectOn_T_Ref_show = getDefectOn_T_Ref_show(allDefect, T_Ref_true_bw, T_Ref)

defectOn_white = allDefect & T_Ref_true_bw;
defectOn_dark = allDefect & ~T_Ref_true_bw;
%%
tmep = T_Ref;
temp2 = T_Ref;
temp3 = T_Ref;

%%
alphaRatio_white = 0.5;
alphaRatio_dark = 0.7;

temp(defectOn_white) = 255;
temp2(defectOn_white) = temp2(defectOn_white) * alphaRatio_white;
temp3(defectOn_white) = temp3(defectOn_white) * alphaRatio_white;

temp(defectOn_dark) = temp(defectOn_dark) * alphaRatio_dark;
temp2(defectOn_dark) = 255;
temp3(defectOn_dark) = temp3(defectOn_dark) * alphaRatio_dark;

defectOn_T_Ref_show = cat(3, temp, temp2, temp3);

end

%%
function defect_show = getDefectShowWidthShift(defectImg, srouceImg ,rgb, strelSize, dy, dx)

%
%
dy_ = round(-dy);
dx_ = round(-dx);
%
%

defectImgShift = circshift(defectImg, [dy_, dx_]);
defect_show = Utility.getDefect_show(defectImgShift, sourceImg ,rgb, strelSize);

end























