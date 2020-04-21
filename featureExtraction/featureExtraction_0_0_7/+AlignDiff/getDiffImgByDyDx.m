function T_diff_true =...
    getDiffImgByDyDx(T_Ref_work, T_Test_work, diff_adv2, dx_final_R, dy_final_R, cropImageDarkPart_dil)

medGrayValue = 127;

%%
resizeRatio = diff_adv2.resizeRatio;
removeRange = diff_adv2.removeRange;

removeRange_ori = removeRange;
removeRange = removeRange * resizeRatio;

%%
T_Ref_work = double(T_Ref_work);
T_Test_work = double(T_Test_work);
T_Ref_work = imresize(T_Ref_work, resizeRatio);
T_Test_work = imresize(T_Test_work, resizeRatio);
cropImageDarkPart_dil = imresize(cropImageDarkPart_dil, resizeRatio);
dx_final_R = dx_final_R * resizeRatio;
dy_final_R = dy_final_R * resizeRatio;

[imgH, imgW] = size(T_Ref_work);

RefImg = T_Ref_work;
TestImg = T_Test_work;
dx_final = dx_final_R;
dy_final = dy_final_R;

%%
diffImgDouble = zeros(imgH, imgW);
Ref_range_x = max(1 + dx_final, 1) : min(imgW + dx_final, imgW);
Test_range_x = max(1 - dx_final, 1) : min(imgW - dx_final, imgW);
Ref_range_y = max(1 + dy_final, 1) : min(imgH + dy_final, imgH);
Test_range_y = max(1 - dy_final, 1) : min(imgH - dy_final, imgH);
RefImg_sub = RefImg(Ref_range_y, Ref_range_x);
TestImg_sub = TestImg(Test_range_y, Test_range_x);
diffImgDouble(Ref_range_y, Ref_range_x) = TestImg_sub - RefImg_sub;
diffImgDouble = Utility.replaceEdgeValue(diffImgDouble, removeRange, 0);
diffImgDouble(cropImageDarkPart_dil) = 0;
diffImgDouble = diffImgDouble + medGrayValue;
diffImgDouble = imresize(diffImgDouble, 1 / resizeRatio);
diffImg_final = uint8(diffImgDouble);
diffImg_final = Utility.replaceEdgeValue(diffImg_final, removeRange_ori, medGrayValue);

%%
T_diff_true = diffImg_final;

end










