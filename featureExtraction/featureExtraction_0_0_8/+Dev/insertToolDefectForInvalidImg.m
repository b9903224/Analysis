function testAllImg_rgb = insertToolDefectForInvalidImg(FeatureResult, testAllImg_rgb);

Image = FeatureResult.Image;

T_Defect = ToolDefectShow.T_Defect;
R_Defect = ToolDefectShow.R_Defect;
T_Test = Image.T_Test;
R_Test = Image.R_Test;

imgH = 256;
imgW = 256;

%%
if isempty(T_Defect) || isempty(R_Defect) || isempty(T_Test) || isempty(R_Test)
    return
end

%%
T_Ref_tool_show = getToolShow(T_Defect, T_Test);
R_Ref_tool_show = getToolShow(R_Defect, R_Test);

%%
row_len = 6;
row_1 = genTestAllImgRow({T_Ref_tool_show, R_Ref_tool_show, T_Defect, R_Defect}, row_len);
testAllImg_cell = row_1;

%%
text_str = cell(1, size(testAllImg_cell, 1));
text_str{1} = {'T_Ref_tool_show', 'R_Ref_tool_show', 'T_Defect', 'R_Defect'};
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

%%
[position, testAllImg] =...
    getTextpositionAndUpdateTestAllImg(testAllImg, testAllImg_cell, textHeight, textWidth, imgH, imgW);

%%
rgb = [0,0,255];
rgb_background = [-50,150,-50];
% testAllImg_rgb = Utility.insertTextByTextRatio(position, text_str, testAllImg, textRatio, rgb);
testAllImg_rgb = Utility.insertTextByStringImgH(position, text_str, testAllImg, textHeight, rgb ,rgb_background);

%%
testAllImg_rgb = [testAllImg_rgb; testAllImg_rgb_toolDefect];

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
function testAllImg = getTestAllImg(testAllSize)

temp255 = uint8(ones(testAllSize)*255);
testAllImg = cat(3, temp255, temp255, temp255);

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
function T_Ref_tool_show = getToolShow(T_Defect, T_Test)

T_Defect = T_Defect == 255;

T_Defect_filter = imdilate(T_Defect, strel('square', 3));
T_Defect_filter(T_Defect) = false;

rgb = [255,0,0];
T_Ref_tool_show = Utility.getHighLightImg(T_Defect_filter, T_Test, rgb);

end














