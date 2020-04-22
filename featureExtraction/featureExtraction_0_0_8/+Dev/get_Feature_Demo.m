function testAllImg_rgb = get_Feature_Demo(FeatureResult)

Image = FeatureResult.Image;
detailData = Image.detailData;
index = detailData.index;
MaskInfo = detailData.MaskInfo;
inspType = MaskInfo.inspType;
layerId = MaskInfo.lyaerId;
lrfData = detailDatal.lrfData;
DefectData = lrfData.DefectData;
U_L = DefectData.U_L;
defectCd_lrf = DefectData.defectCd;

featureVersion = Image.featureVersion;
kernelVersion = detailData.kernelVersion;

%%
defectCdByRule = FeatureResult.defectCdByRule;
defectCd_judgeReason = FeatureResult.defectCd_judgeReason;

%%
T_Ref = Image.T_Ref;
T_Test = Image.T_Test;
R_Ref = Image.R_Ref;
R_Test = Image.R_Test;

[imgH, imgW] = size(T_Ref);

%%
T_diff = Image.T_diff;
R_diff = Image.R_diff;

T_diff_plus = Image.T_diff_plus;
T_diff_minus = Image.T_diff_minus;
R_diff_plus = Image.R_diff_plus;
R_diff_minus = Image.R_diff_minus;

T_diff_plus2 = Image.T_diff_plus2;
T_diff_minus2 = Image.T_diff_minus2;
R_diff_plus2 = Image.R_diff_plus2;
R_diff_minus2 = Image.R_diff_minus2;

allDefect = Image.allDefect;
allDefect_show = Image.allDefect_show;
allDefect_show2 = Image.allDefect_show2;
allDefect2 = Image.allDefect2;
allDefect2_show = Image.allDefect2_show;
allDefect2_show2 = Image.allDefect2_show2;

T_diff_true_scaled = Image.T_diff_true_scaled;
R_diff_true_scaled = Image.R_diff_true_scaled;

%%
T_mainPattern = Image.T_mainPattern;
SB_show = Image.SB_show;
T_Ref_SB_show = Image.T_Ref_SB_show;

%%
nuisanceDefect_T_show = Image.nuisanceDefect_T_show;
nuisanceDefect_R_show = Image.nuisanceDefect_R_show;

%%
T_Ref_show = Image.T_Ref_show;
T_Test_show = Image.T_Test_show;
T_diff_true_show = Image.T_diff_true_show;
T_diff_true_scaled_show = Image.T_diff_true_scaled_show;

R_Ref_show = Image.R_Ref_show;
R_Test_show = Image.R_Test_show;
R_diff_true_show = Image.R_diff_true_show;
R_diff_true_scaled_show = Image.R_diff_true_scaled_show;

%%
ToolDefectShow = Image.ToolDefectShow;

T_Ref_tool_show = ToolDefectShow.T_Ref_tool_show;
T_Test_tool_show = ToolDefectShow.T_Test_tool_show;
T_diff_true_tool_show = ToolDefectShow.T_diff_true_tool_show;
T_diff_true_scaled_tool_show = ToolDefectShow.T_diff_true_scaled_tool_show;

R_Ref_tool_show = ToolDefectShow.R_Ref_tool_show;
R_Test_tool_show = ToolDefectShow.R_Test_tool_show;
R_diff_true_tool_show = ToolDefectShow.R_diff_true_tool_show;
R_diff_true_scaled_tool_show = ToolDefectShow.R_diff_true_scaled_tool_show;

T_Defect = ToolDefectShow.T_Defect;
R_Defect = ToolDefectShow.R_Defect;

%%
diff = Image.diff;
T_diff_true_c = diff.T_diff_true;
R_diff_true_c = diff.R_diff_true;
dx_final_T_c = diff.dx_final_T;
dy_final_T_c = diff.dy_final_T;
dx_final_R_c = diff.dx_final_R;
dy_final_R_c = diff.dy_final_R;

diff_adv = Image.diff_adv;
T_diff_true_f = diff_adv.T_diff_true;
R_diff_true_f = diff_adv.R_diff_true;
dx_final_T_f = diff_adv.dx_final_T;
dy_final_T_f = diff_adv.dy_final_T;
dx_final_R_f = diff_adv.dx_final_R;
dy_final_R_f = diff_adv.dy_final_R;

diff_adv0 = Image.diff_adv0;
T_diff_true_f0 = diff_adv0.T_diff_true;
R_diff_true_f0 = diff_adv0.R_diff_true;
dx_final_T_f0 = diff_adv0.dx_final_T;
dy_final_T_f0 = diff_adv0.dy_final_T;
dx_final_R_f0 = diff_adv0.dx_final_R;
dy_final_R_f0 = diff_adv0.dy_final_R;

diff_adv2 = Image.diff_adv2;
T_diff_true_f2 = diff_adv2.T_diff_true;
R_diff_true_f2 = diff_adv2.R_diff_true;
dx_final_T_f2 = diff_adv2.dx_final_T;
dy_final_T_f2 = diff_adv2.dy_final_T;
dx_final_R_f2 = diff_adv2.dx_final_R;
dy_final_R_f2 = diff_adv2.dy_final_R;

%%
FlatByDir = Image.FlatByDir;
isFlat_hoz = FlatByDir.isFlat_hoz;
isFlat_ver = FlatByDir.isFlat_ver;

isFlat_hoz_TR = FlatByDir.isFlat_hoz_TR;
isFlat_hoz_TT = FlatByDir.isFlat_hoz_TT;
isFlat_hoz_RR = FlatByDir.isFlat_hoz_RR;
isFlat_hoz_RT = FlatByDir.isFlat_hoz_RT;

isFlat_ver_TR = FlatByDir.isFlat_ver_TR;
isFlat_ver_TT = FlatByDir.isFlat_ver_TT;
isFlat_ver_RR = FlatByDir.isFlat_ver_RR;
isFlat_ver_RT = FlatByDir.isFlat_ver_RT;

%%
row_len = 8;
% row_1 = genTestAllImgRow({}, row_len);
row_1 = genTestAllImgRow({T_Ref, T_Test, T_diff_true_f2, T_diff_true_scaled, R_Ref, R_Test, R_diff_true_f2, R_diff_true_scaled}, row_len);
row_2 = genTestAllImgRow({T_diff_true_c, T_diff_true_f0, T_diff_true_f, T_diff, R_diff_true_c, R_diff_true_f0, R_diff_true_f, R_diff}, row_len);
row_3 = genTestAllImgRow({T_diff_plus, T_diff_minus, R_diff_plus, R_diff_minus, T_diff_plus2, T_diff_minus2, R_diff_plus2, R_diff_minus2}, row_len);
row_4 = genTestAllImgRow({T_Ref_show, T_Test_show, T_diff_true_show, T_diff_true_scaled_show, R_Ref_show, R_Test_show, R_diff_true_show, R_diff_true_scaled_show}, row_len);
row_5 = genTestAllImgRow({T_Ref_tool_show, T_Test_tool_show, T_diff_true_tool_show, T_diff_true_scaled_tool_show, R_Ref_tool_show, R_Test_tool_show, R_diff_true_tool_show, R_diff_true_scaled_tool_show}, row_len);
row_6 = genTestAllImgRow({T_mainPattern, SB_show, T_Ref_SB_show, T_Defect, R_Defect}, row_len);
row_7 = genTestAllImgRow({nuisanceDefect_T_show, nuisanceDefect_R_show}, row_len);
row_8 = genTestAllImgRow({allDefect, allDefect_show, allDefect_show2, [], allDefect2, allDefect2_show, allDefect2_show2, []});
testAllImg_cell = [row_1; row_2; row_3; row_4; row_5; row_6; row_7; row_8];

%%
text_str = cell(1, size(testAllImg_cell, 1));
% text_str{i} = {};
text_str{1} = {'T_Ref', 'T_Test', 'T_diff_true_f2', 'T_diff_true_scaled', 'R_Ref', 'R_Test', 'R_diff_true_f2', 'R_diff_true_scaled'};
text_str{2} = {'T_diff_true_true_c', 'T_diff_true_true_f0', 'T_diff_true_true_f', 'T_diff', 'R_diff_true_true_c', 'R_diff_true_true_f0', 'R_diff_true_true_f', 'R_diff'};
text_str{3} = {'T_diff_plus', 'T_diff_minus', 'R_diff_plus', 'R_diff_minus', 'T_diff_plus2', 'T_diff_minus2', 'R_diff_plus2', 'R_diff_minus2'};
text_str{4} = {'T_Ref_show', 'T_Test_show', 'T_diff_true_show', 'T_diff_true_scaled_show', 'R_Ref_show', 'R_Test_show', 'R_diff_true_show', 'R_diff_true_scaled_show'};
text_str{5} = {'T_Ref_tool_show', 'T_Test_tool_show', 'T_diff_true_tool_show', 'T_diff_true_scaled_tool_show', 'R_Ref_tool_show', 'R_Test_tool_show', 'R_diff_true_tool_show', 'R_diff_true_scaled_tool_show'};
text_str{6} = {'T_mainPattern', 'SB_show', 'T_Ref_SB_show', 'T_Defect', 'R_Defect'};
text_str{7} = {'nuisanceDefect_T_show', 'nuisanceDefect_R_show'};
text_str{8} = {'allDefect', 'allDefect_show', 'allDefect_show2', 'allDefect2', 'allDefect2_show', 'allDefect2_show2'};
insertColumnString_row = numel(text_str);
text_str = cat(2, text_str{:});
text_str = strrep(text_str, '_show', '');
text_str = strrep(text_str, '_', '');

%%
textHeight = 24;
textWidth = 5;
textRatio = 1;
textHeightCount = 7;
testAllSize = [(imgH + textHeight) * size(testAllImg_cell, 1) + textHeight * textHeightCount, (imgW + textWidth) * size(testAllImg_cell, 2)];
testAllImg = getTestAllImg(testAllSize);
% testAllImg = getTestAllImg(testAllSize, defectCd_lrf);

%%
[position, testAllImg] =...
    getTextpositionAndUpdateTestAllImg(testAllImg, testAllImg_cell, textHeight, textWidth, imgH, imgW);

%%
rgb = [0,0,255];
rgb_background = [-50,150,-50];
% testAllImg_rgb = Utility.insertTextByTextRatio(position, text_str, testAllImg, textRatio, rgb);
testAllImg_rgb = Utility.insertTextByStringImgH(position, text_str, testAllImg, textHeight, rgb ,rgb_background);

%% left
text_str = {};
text_str = [text_str, sprintf('index: %g', index)];
text_str = [text_str, sprintf('inspType: %s', inspType)];
text_str = [text_str, sprintf('layerId: %s', layerId)];
text_str = [text_str, sprintf('U_L: %s', U_L)];
text_str = [text_str, sprintf('defectCode_LRF: %s', defectCd_lrf)];
text_str = [text_str, sprintf('ADC code: %s', defectCdByRule)];
text_str = [text_str, sprintf('Reason: %s', defectCd_judgeReason)];

xStart = 1;
yStart = (imgH + textHeight) * insertColumnString_row + 1;
text_str_len = numel(text_str);
rgbAry = repmat([0,0,255], text_str_len, 1);
rgbAry([2,3,6,7], :) = repmat([255,0,0], 4, 1);
rgb_backgroundAry = repmat([-50, 150, 50], text_str_len, 1);
testAllImg = insertColumnString(testAllImg, text_str, yStart, xStart, rgbAry, rgb_backgroundAry, textHeight);

%% median
text_str = {};
text_str = [text_str, sprintf('dx_finalt_T: %g, %.5f, %.5f, %.5f', dx_final_T_c, dx_final_T_f0, dx_final_T_f0, dx_final_T_f2)];
text_str = [text_str, sprintf('dy_finalt_T: %g, %.5f, %.5f, %.5f', dy_final_T_c, dy_final_T_f0, dy_final_T_f0, dy_final_T_f2)];
text_str = [text_str, sprintf('dx_finalt_R: %g, %.5f, %.5f, %.5f', dx_final_R_c, dx_final_R_f0, dx_final_R_f0, dx_final_R_f2)];
text_str = [text_str, sprintf('dy_finalt_R: %g, %.5f, %.5f, %.5f', dy_final_R_c, dy_final_R_f0, dy_final_R_f0, dy_final_R_f2)];
text_str = [text_str, sprintf('isFlat_hoz: %g (%g, %g, %g, %g)', isFlat_hoz, isFlat_hoz_TR, isFlat_hoz_TT, isFlat_hoz_RR, isFlat_hoz_RT)];
text_str = [text_str, sprintf('isFlat_ver: %g (%g, %g, %g, %g)', isFlat_ver, isFlat_ver_TR, isFlat_ver_TT, isFlat_ver_RR, isFlat_ver_RT)];

xStart = (imgW + textWidth) * 2 + 1;
yStart = (imgH + textHeight) * insertColumnString_row + 1;
text_str_len = numel(text_str);
rgbAry = repmat([0,0,255], text_str_len, 1);
rgbAry([1,2,3,4], :) = repmat([255,0,0], 4, 1);
rgb_backgroundAry = repmat([-50, 150, 50], text_str_len, 1);
testAllImg = insertColumnString(testAllImg, text_str, yStart, xStart, rgbAry, rgb_backgroundAry, textHeight);

%%
testAllImg_rgb = DemoProd.insertVersion(testAllImg, featureVersion, kernelVersion);

end

%%
function testAllImg = getTestAllImg(testAllSize)

% temp255 = uint8(ones(testAllSize)*255);
% testAllImg = cat(3, temp255, temp255, temp255);

testAllImg = cat(3, uint8(ones(testAllSize) * 204),...
    uint8(ones(testAllSize) * 229),...
    uint8(ones(testAllSize) * 255));

end

%%
function testAllImg_rgb = insertColumnString(testAllImg_rgb, text_str, yStart, xStart, rgbAry, rgb_backgroundAry, textHeight)

text_str_len = numel(text_str);
for index = 1 : text_str_len
    rgb = rgbAry(index, :);
    rgb_background = rgb_backgroundAry(index, :);
    inputString = text_str{index};
%     stringImg = Utility.getImgByString(inputString);
    stringImg = Utility.getImgByString_24(inputString);
    [imgH_dest, imgW_dest] = size(stringImg);
    y_range = (index - 1) * textHeight + 1 : (index - 1) * textHeight + imgH_dest;
    y_range = y_range + yStart;
    x_range = xStart + 1 : xStart + imgW_dest;
    testAllImg_rgb = Utility.getHighLightImgByRange(stringImg, testAllImg_rgb, y_range, x_range, rgb, rgb_background);
end

end

%%
function position = getTextPosition(text_str, imgH, imgW, textHeight, textWidth)

locX_ini = (imgW + textWidth) * 2 + 1;
locY_ini = (imgH + textHeight) * 2 + textHeight + 1;

text_str_len = numel(text_str);
position = ones(text_str_len, 2);
for i = 1 : text_str_len
    position(i, 1) = locX_ini;
    position(i, 2) = locY_ini + (i - 1) * textHeight;
end

end

%%
function [position, testAllImg] =...
    getTextpositionAndUpdateTestAllImg(testAllImg, testAllImg_cell, textHeight, textWidth, imgH, imgW)

position = [];
k_limit = size(testAllImg_cell, 1) - 1;
j_limit = size(testAllImg_cell, 2) - 1;
for k = 0 : k_limit % vertical
    y = (k + 1) * textHeight + k * imgH + 1; % for image
    for j = 0 : j_limit % horizon
        x = j * (textWidth + imgW) + 1; % for image
        temp = testAllImg_cell{k + 1, j + 1};
        if ~isempty(temp)
            position = [position; j * (imgW + textWidth) + 1, k * (imgH + textHeight) + 1]; % for text
            [~, ~, size3] = size(temp);
            if isa(temp, 'logical')
                temp = uint8(temp) * 255;
            end
            for chanel_i = 1 : 3
                if size3 == 3
                    testAllImg(y : y + imgH - 1, x : x + imgW - 1, chanel_i) = temp(:, :, chanel_i);
                else
                    testAllImg(y : y + imgH - 1, x : x + imgW - 1, chanel_i) = temp;
                end
            end
        end
    end
end


end

%%
function row = genTestAllImgRow(varargin)
cell_1 = varargin{1};
row_len = varargin{2};

row = cell(1, row_len);
for i = 1 : row_len
    if i <= numel(cell_1)
        img = cell_1{i};
    else
        img = [];
    end
    row{i} = img;
end

end












