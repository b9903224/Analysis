function [dy_final, dx_final, diffImg_final] =...
    getDiffImg_adv(RefImg, TestImg, dy_final_T_ori, dx_final_T_ori, searchRange, resizeRatio, removeRange, cropImageDarkPart_dil, isFlat_hoz, isFlat_ver)

% global medGrayValue
medGrayValue = 127;

removeRange_ori = removeRAnge;
cropImageDarkPart_dil_ori = cropImageDarkPart_dil;

%%
searchRange = searchRange * resizeRatio;
removeRange = removeRange * resizeRatio;

dy_final_T_ori = dy_final_T_ori * resizeRatio;
dx_final_T_ori = dx_final_T_ori * resizeRatio;

RefImg = int16(RefImg);
TestImg = int16(TestImg);
RefImg = int8(RefImg - medGrayValue);
TestImg = int8(TestImg - medGrayValue);
RefImg = imresize(RefImg, resizeRatio);
TestImg = imresize(TestImg, resizeRatio);
[imgH, imgW] = size(RefImg);

dy_final = [];
dx_final = [];
count = 0;

diffImgDouble = zeros(imgH, imgW, 'int8');
cropImageDarkPart_dil = imresize(cropImageDarkPart_dil, resizeRatio);

%%
residualValue_final = inf;
dy_range = -searchRange + dy_final_T_ori : 1 : searchRange + dy_final_T_ori;
dx_range = -searchRange + dx_final_T_ori : 1 : searchRange + dx_final_T_ori;
if isFlat_hoz
    dx_range = 0;
end
if isFlat_ver
    dy_range = 0;
end
for dy = dy_range
    for dx = dx_range
        count = count + 1;
        diffImgDouble = circshift(TestImg, [dy, dx]) - RefImg;
        diffImgDouble = Utility.replaceEdgeValue(diffImgDouble, removeRange, 0);
        diffImgDouble(cropImageDarkPart_dil) = 0;
        diffImgAbs = abs(diffImgDouble);
        residualValue = sum(diffImgAbs(:));
        if residualValue < residualValue_final
            residualValue_final = residualValue;
            dx_final = dx;
            dy_final = dy;
        end
    end
end

%%
diffImgDouble(:) = 0;
Ref_range_x = max(1 + dx_final, 1) : min(imgW + dx_final, imgW);
Test_range_x = max(1 - dx_final, 1) : min(imgW - dx_final, imgW);
Ref_range_y = max(1 + dy_final, 1) : min(imgH + dy_final, imgH);
Test_range_y = max(1 - dy_final, 1) : min(imgH - dy_final, imgH);
RefImg_sub = RefImg(Ref_range_y, Ref_range_x);
TestImg_sub = TestImg(Test_range_y, Test_range_x);
diffImgDouble(Ref_range_y, Ref_range_x) = TestImg_sub - RefImg_sub;
diffImgDouble = Utility.replaceEdgeValue(diffImgDouble, removeRange, 0);
diffImgDouble(cropImageDarkPart_dil) = 0;
diffImgDouble = int16(diffImgDouble) + medGrayValue;
diffImgDouble = imresize(diffImgDouble, 1/resizeRatio);
diffImg_final = uint8(diffImgDouble);
diffImg_final = Utility.replaceEdgeValue(diffImg_final, removeRange_ori, medGrayValue);
% disp(count)

%%
dy_final = dy_final / resizeRatio;
dx_final = dx_final / resizeRatio;

end








