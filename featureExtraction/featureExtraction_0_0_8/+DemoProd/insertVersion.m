function demoImgProd = insertVersion(testAllImg, featureVersion, kernelVersion)

featureVersionImgBw = getVersionImgBw('Feature Ver.(ADC): ', featureVersion);
featureVersionImgRanbow = getRanbowImg(featureVersionImgBw, true);

kernelImgBw = getVersionImgBw('kernel Ver.: ', kernelVersion);
kernelImgRanbow = getRanbowImg(kernelImgBw, true);

[signatureImgBw, signatureImgRanbow] = getSignatureImg;

%%
demoImg = testAllImg;

skipEdge = 1;

imgH_last = 0;
demoImg = getDefectShowWithVersion(demoImg, signatureImgBw, signatureImgRanbow, imgH_last, skipEdge);
imgH_last = imgH_last + size(signatureImgBw, 1);
demoImg = getDefectShowWithVersion(demoImg, featureVersionImgBw, featureVersionImgRanbow, imgH_last, skipEdge);
imgH_last = imgH_last + size(featureVersionImgBw, 1);
demoImg = getDefectShowWithVersion(demoImg, kernelVersionImgBw, kernelVersionImgRanbow, imgH_last, skipEdge);

demoImgProd = demoImg;

end

%%
function defect_show = getDefectShowWithVersion(defect_show, signatureImgBw, signatureImgRanbow, imgH_last, skipEdge)

[imgH_sub, imgW_sub] = size(signatureImgBw);
[imgH, imgW, ~] = size(defect_show);

%% RD
y_range_sub = (imgH - imgH_last - imgH_sub + 1 : imgH - imgH_last) - skipEdge;
x_range_sub = (imgW - imgW_sub + 1 : imgW) - skipEdge;

%% LD
% y_range_sub = (imgH - imgH_last - imgH_sub + 1 : imgH - imgH_last) - skipEdge;
% x_range = (1 : imgW_sub) + skipEdge;

%%
defect_show_sub = defect_show(y_range_sub, x_range_sub, :);

defect_show_sub(:) = 255;

defect_show_sub = insertRanbowImg(defect_show_sub, signatureImgBw, signatureImgRanbow);

defect_show(y_range_sub, x_range_sub, :) = defect_show_sub;

end

%%
function srcImg = insertRanbowImg(srcImg, destImg, ranbowImg)

for i = 1 : 3
    srcImg_ch = srcImg(:,:,i);
    ranbowImg_ch = ranbowImg(:,:,i);
    srcImg_ch(destImg) = ranbowImg_ch(destImg);
    srcImg(:,:,i) = srcImg_ch;
end

end

%%
function versionImgBw = getVersionImgBw(versionType, versionDigit)

versionTypeImg = Utility.getImgByString(versionType);

%%
% versionDigitImg = Utility.getImgByString_24(versionDigit);
% versionDigitImg = versionDigitImg(1 : end - 3, :);
% versionDigitImg = [versionDigitImg, false(size(versionDigitImg, 1), 1)];

versionDigitImg = Utility.getImgByString(versionDigit);
% versionDigitImg = [versionDigitImg, false(size(versionDigitImg, 1), 1)];

%%
[imgH_type, imgW_type] = size(versionTypeImg);
[imgH_digit, imgW_digit] = size(versionDigitImg);

imgH_max = max(imgH_type, imgH_digit);
imgW_all = imgW_type + imgW_digit;

backGroundImg = false(imgH_max, imgW_all);

y_range = imgH_max - imgH_type + 1 : imgH_max;
x_range = 1 : imgW_type;
backGroundImg(y_range, x_range) = versionTypeImg;

y_range = imgH_max - imgH_digit + 1 : imgH_max;
x_range = imgW_type + 1 : imgW_all;
backGroundImg(y_range, x_range) = versionDigitImg;

versionImgBw = backGroundImg;

end

%%
function ranbowImg = getRanbowImg(templateImg, isHoz)

ranbowColor = [[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0.015625;0.03125;0.046875;0.0625;0.078125;0.09375;0.109375;0.125;0.140625;0.15625;0.171875;0.1875;0.203125;0.21875;0.234375;0.25;0.265625;0.28125;0.296875;0.3125;0.328125;0.34375;0.359375;0.375;0.390625;0.40625;0.421875;0.4375;0.453125;0.46875;0.484375;0.5;0.515625;0.53125;0.546875;0.5625;0.578125;0.59375;0.609375;0.625;0.640625;0.65625;0.671875;0.6875;0.703125;0.71875;0.734375;0.75;0.765625;0.78125;0.796875;0.8125;0.828125;0.84375;0.859375;0.875;0.890625;0.90625;0.921875;0.9375;0.953125;0.96875;0.984375;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0.984375;0.96875;0.953125;0.9375;0.921875;0.90625;0.890625;0.875;0.859375;0.84375;0.828125;0.8125;0.796875;0.78125;0.765625;0.75;0.734375;0.71875;0.703125;0.6875;0.671875;0.65625;0.640625;0.625;0.609375;0.59375;0.578125;0.5625;0.546875;0.53125;0.515625;0.5],...
    [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0.015625;0.03125;0.046875;0.0625;0.078125;0.09375;0.109375;0.125;0.140625;0.15625;0.171875;0.1875;0.203125;0.21875;0.234375;0.25;0.265625;0.28125;0.296875;0.3125;0.328125;0.34375;0.359375;0.375;0.390625;0.40625;0.421875;0.4375;0.453125;0.46875;0.484375;0.5;0.515625;0.53125;0.546875;0.5625;0.578125;0.59375;0.609375;0.625;0.640625;0.65625;0.671875;0.6875;0.703125;0.71875;0.734375;0.75;0.765625;0.78125;0.796875;0.8125;0.828125;0.84375;0.859375;0.875;0.890625;0.90625;0.921875;0.9375;0.953125;0.96875;0.984375;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0.984375;0.96875;0.953125;0.9375;0.921875;0.90625;0.890625;0.875;0.859375;0.84375;0.828125;0.8125;0.796875;0.78125;0.765625;0.75;0.734375;0.71875;0.703125;0.6875;0.671875;0.65625;0.640625;0.625;0.609375;0.59375;0.578125;0.5625;0.546875;0.53125;0.515625;0.5;0.484375;0.46875;0.453125;0.4375;0.421875;0.40625;0.390625;0.375;0.359375;0.34375;0.328125;0.3125;0.296875;0.28125;0.265625;0.25;0.234375;0.21875;0.203125;0.1875;0.171875;0.15625;0.140625;0.125;0.109375;0.09375;0.078125;0.0625;0.046875;0.03125;0.015625;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0],...
    [0.515625;0.53125;0.546875;0.5625;0.578125;0.59375;0.609375;0.625;0.640625;0.65625;0.671875;0.6875;0.703125;0.71875;0.734375;0.75;0.765625;0.78125;0.796875;0.8125;0.828125;0.84375;0.859375;0.875;0.890625;0.90625;0.921875;0.9375;0.953125;0.96875;0.984375;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0.984375;0.96875;0.953125;0.9375;0.921875;0.90625;0.890625;0.875;0.859375;0.84375;0.828125;0.8125;0.796875;0.78125;0.765625;0.75;0.734375;0.71875;0.703125;0.6875;0.671875;0.65625;0.640625;0.625;0.609375;0.59375;0.578125;0.5625;0.546875;0.53125;0.515625;0.5;0.484375;0.46875;0.453125;0.4375;0.421875;0.40625;0.390625;0.375;0.359375;0.34375;0.328125;0.3125;0.296875;0.28125;0.265625;0.25;0.234375;0.21875;0.203125;0.1875;0.171875;0.15625;0.140625;0.125;0.109375;0.09375;0.078125;0.0625;0.046875;0.03125;0.015625;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]];
ranbowColor = uint8(ranbowColor * 255);
if isHoz
    ranbowColor = ranbowColor';
    ranbowImg = cat(3, ranbowColor(1, :), ranbowColor(2, :), ranbowColor(3, :));
else
    ranbowImg = cat(3, ranbowColor(:, 1), ranbowColor(:, 2), ranbowColor(:, 3));
end
% figure, imshow(ranbowImg)

%%
[imgH, imgW] = size(templateImg);
if isHoz
    ranbowImg = repmat(ranbowImg, [imgH, 1]);
else
    ranbowImg = repmat(ranbowImg, [1, imgH]);
end

%%
ranbowImg = imresize(ranbowImg, [imgH, imgW]);
% figure, imshow(ranbowImg)

end

%%
function [signatureImgBw, signatureImgRanbow] = getSignatureImg

signatureImgBw = [Utility.getImgByString('MCHSIAOJ'), ~Utility.getImgByString('DESIGNED')];
% signatureImgBw = [Utility.getImgByString_24('MCHSIAOJ'), ~Utility.getImgByString_24('DESIGNED')];
signatureImgBw = [false(size(signatureImgBw, 1), 1), signatureImgBw, false(size(signatureImgBw, 1), 1)];
signatureImgBw = Utility.replaceEdgeValue(signatureImgBw, 1, true);
signatureImgRanbow = getRanbowImg(signatureImgBw, true);
signatureImgRanbow = shiftRanbowImg(signatureImgRanbow, true, 1);

end

%%
function ranbowImg = shiftRanbowImg(ranbowImg, isHoz, shiftDir)

if ~isHoz
    ranbowImg = rot90(ranbowImg, 1);
end

[imgH, ~, ~] = size(ranbowImg);
for y = 1 : imgH
    shiftSize = (imgH - y + 1) * 2 * shiftDir;
    ranbowImg(y,:,:) = circshift(ranbowImg(y,:,:), [1, shiftSize]);
end

if ~isHoz
    ranbowImg = rot90(ranbowImg, -1);
end

end

% a = jet(256);
% fprintf('[')
% for i = 1 : 3
%     fprintf('[');
%     a_col = a(:, i);
%     for j = 1 : numel(a_col)
%         fprintf('%g', a_col(j))
%         if j ~= numel(a_col)
%             fprintf(';')
%         end
%     end
%     fprintf(']')
%     if i~=3
%         fprintf(',...\n')
%     end
% end
% fprintf('];\n')














