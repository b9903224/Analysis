function DemoImgProdTemplate = getDemoImgProdTemplate

% tic

%%
imgH = 256;
imgW = 256;

%%
noImageImg = DemoProd.getNoImageImg(imgH, imgW);

UpperRefReflect1 = noImageImg;
UpperRefReflect2 = noImageImg;
DiffUpperCenterReflect1 = noImageImg;
DiffUpperCenterReflect2 = noImageImg;
DiffUpperCenterReflect1_scaled = noImageImg;
DiffUpperCenterReflect2_scaled = noImageImg;

CenterDefectReflect1 = noImageImg;
CenterDefectReflect2 = noImageImg;
DiffLowerCenterReflect1 = noImageImg;
DiffLowerCenterReflect2 = noImageImg;
DiffLowerCenterReflect1_scaled = noImageImg;
DiffLowerCenterReflect2_scaled = noImageImg;

LowerRefReflect1 = noImageImg;
LowerRefReflect2 = noImageImg;

%%
row_len = 6;
% row_1 = genTestAllImgRow({}, row_len);
row_1 = genTestAllImgRow({UpperRefReflect1, UpperRefReflect2, DiffUpperCenterReflect1, DiffUpperCenterReflect2, DiffUpperCenterReflect1_scaled, DiffUpperCenterReflect2_scaled}, row_len);
row_2 = genTestAllImgRow({CenterDefectReflect1, CenterDefectReflect2, DiffLowerCenterReflect1, DiffLowerCenterReflect2, DiffLowerCenterReflect1_scaled, DiffLowerCenterReflect2_scaled}, row_len);
row_last = genTestAllImgRow({LowerRefReflect1, LowerRefReflect2}, row_len);
testAllImg_cell = [row_1; row_2; row_last];

%%
text_str = cell(1, size(testAllImg_cell, 1));
text_str{1} = {'Upper Reference:Trans', 'Upper Reference:Reflect', 'Diff Upper/Center:Trans', 'Diff Upper/Center:Reflect', 'Dif Up/Center:Trans_scaled', 'Dif Up/Center:Refl._scaled'};
text_str{2} = {'Center Defect:Trans', 'Center Defect:Reflect', 'Diff Lower/Center:Trans', 'Diff Lower/Center:Reflect', 'Dif Low/Center:Trans_scaled', 'Dif Low/Center:Refl._scaled'};
text_str{3} = {'Lower Reference:Trans', 'Lower Reference:Reflect'};
text_str = cat(2, text_str{:});

%%
textHeight = 24;
textWidth = 5;
textRatio = 1;
textHeightCount = 0;
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
demoImgProdTemplate = testAllImg_rgb;

DemoImgProdTemplate = struct;
DemoImgProdTemplate.demoImgProdTemplate = demoImgProdTemplate;
DemoImgProdTemplate.textHeight = textHeight;
DemoImgProdTemplate.textWidth = textWidth;
DemoImgProdTemplate.textRatio = textRatio;
DemoImgProdTemplate.textHeightCount = textHeightCount;

%%
% toc

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
















