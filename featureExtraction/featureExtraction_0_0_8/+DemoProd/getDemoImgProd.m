function FeatureResult = getDemoImgProd(FeatureResult)

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
DemoImgProdTemplate = detailData.DemoImgProdTemplate;
demoImgProdTemplate = DemoImgProdTemplate.demoImgProdTemplate;
textHeight = DemoImgProdTemplate.textHeight;
textWidth = DemoImgProdTemplate.textWidth;
% textRatio = DemoImgProdTemplate.textRatio;

%%
defectCdByRule = FeatureResult.defectCdByRule;
defectCd_judgeReason = FeatureResult.defectCd_judgeReason;

%%
diff_adv2 = Image.defectCd_judgeReason;
dx_final_T_f2 = diff_adv2.dx_final_T_f2;
dy_final_T_f2 = diff_adv2.dy_final_T_f2;
dx_final_R_f2 = diff_adv2.dx_final_R_f2;
dy_final_R_f2 = diff_adv2.dy_final_R_f2;

%%
T_Ref = Image.T_Ref_show;
T_Test = Image.T_Test_show;
T_diff_true = Image.T_diff_true_show;
T_diff_true_scaled = Image.T_diff_true_scaled;
T_diff_true_scaled = cat(3, T_diff_true_scaled, T_diff_true_scaled, T_diff_true_scaled);

R_Ref = Image.R_Ref_show;
R_Test = Image.R_Test_show;
R_diff_true = Image.R_diff_true_show;
R_diff_true_scaled = Image.R_diff_true_scaled;
R_diff_true_scaled = cat(3, R_diff_true_scaled, R_diff_true_scaled, R_diff_true_scaled);

%%
imgH = 256;
imgW = 256;

%%
UpperRefReflect1 = [];
UpperRefReflect2 = [];
DiffUpperCenterReflect1 = [];
DiffUpperCenterReflect2 = [];
DiffUpperCenterReflect1_scaled = [];
DiffUpperCenterReflect2_scaled = [];

CenterDefectReflect1 = T_Test;
CenterDefectReflect2 = R_Test;
DiffLowerCenterReflect1 = [];
DiffLowerCenterReflect2 = [];
DiffLowerCenterReflect1_scaled = [];
DiffLowerCenterReflect2_scaled = [];

LowerRefReflect1 = [];
LowerRefReflect2 = [];

%%
if false
    
elseif strcmp(U_L, '1')
    LowerRefReflect1 = T_Ref;
    LowerRefReflect2 = R_Ref;
    DiffLowerCenterReflect1 = T_diff_true;
    DiffLowerCenterReflect2 = R_diff_true;
    DiffLowerCenterReflect1_scaled = T_diff_true_scaled;
    DiffLowerCenterReflect2_scaled = R_diff_true_scaled;
elseif strcmp(U_L, '2')
    UpperRefReflect1 = T_Ref;
    UpperRefReflect2 = R_Ref;
    DiffUpperCenterReflect1 = T_diff_true;
    DiffUpperCenterReflect2 = R_diff_true;
    DiffUpperCenterReflect1_scaled = T_diff_true_scaled;
    DiffUpperCenterReflect2_scaled = R_diff_true_scaled;
elseif strcmp(U_L, '3')
    LowerRefReflect1 = T_Ref;
    LowerRefReflect2 = R_Ref;
    DiffLowerCenterReflect1 = T_diff_true;
    DiffLowerCenterReflect2 = R_diff_true;
    DiffLowerCenterReflect1_scaled = T_diff_true_scaled;
    DiffLowerCenterReflect2_scaled = R_diff_true_scaled;
elseif strcmp(U_L, '0')
    
end

%%
row_len = 6;
% row_1 = genTestAllImgRow({}, row_len);
row_1 = genTestAllImgRow({UpperRefReflect1, UpperRefReflect2, DiffUpperCenterReflect1, DiffUpperCenterReflect2, DiffUpperCenterReflect1_scaled, DiffUpperCenterReflect2_scaled}, row_len);
row_2 = genTestAllImgRow({CenterDefectReflect1, CenterDefectReflect2, DiffLowerCenterReflect1, DiffLowerCenterReflect2, DiffLowerCenterReflect1_scaled, DiffLowerCenterReflect2_scaled}, row_len);
row_last = genTestAllImgRow({LowerRefReflect1, LowerRefReflect2}, row_len);
testAllImg_cell = [row_1; row_2; row_last];

%%
[~, testAllImg] =...
    getTextpositionAndUpdateTestAllImg(demoImgProdTemplate, testAllImg_cell, textHeight, textWidth, imgH, imgW);

%%
text_str = {};
text_str = [text_str, sprintf('index: %g', index)];
text_str = [text_str, sprintf('inspType: %s', inspType)];
text_str = [text_str, sprintf('layerId: %s', layerId)];
text_str = [text_str, sprintf('U_L: %s', U_L)];
text_str = [text_str, sprintf('defectCode_LRF: %s', defectCd_lrf)];
text_str = [text_str, sprintf('ADC code: %s', defectCdByRule)];
text_str = [text_str, sprintf('Reason: %s', defectCd_judgeReason)];

text_str = [text_str, sprintf('T_f2 [dx, dy]: [%.5f, %.5f]', dx_final_T_f2, dy_final_T_f2)];
text_str = [text_str, sprintf('R_f2 [dx, dy]: [%.5f, %.5f]', dx_final_R_f2, dy_final_R_f2)];

% position = getTextPosition(text_str, imgH, imgW, textHeight, textWidth);
% rgb = [0,0,255];
% rgb_background = [-50,150,50];
% testAllImg = Utility.insertTextByStringImgH(position, text_str, testAllImg, textHeight, rgb, rgb_background);

xStart = (imgW + textWidth) * 2;
yStart = (imgH + textHeight) * 2 + textHeight;
text_str_len = numel(text_str);
rgbAry = repmat([0,0,255], text_str_len, 1);
rgbAry([2,3,6,7], :) = repmat([255,0,0], 4, 1);
rgb_backgroundAry = repmat([-50, 150, 50], text_str_len, 1);
testAllImg = insertColumnString(testAllImg, text_str, yStart, xStart, rgbAry, rgb_backgroundAry, textHeight);

%%
% demoImgProd = DemoProd.insertFeatureVersion(testAllImg, featureVersion, model_id);
demoImgProd = DemoProd.insertVersion(testAllImg, featureVersion, kernelVersion);

%%
FeatureResult.demoImgProd = demoImgProd;

%%
% toc

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

%%

















