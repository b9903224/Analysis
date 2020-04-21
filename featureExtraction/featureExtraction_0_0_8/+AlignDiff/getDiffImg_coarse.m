function [dy_final, dx_final, diffImg_final] =...
    getDiffImg_coarse(RefImg, TestImg, searchRange, removeRange, cropImageDarkPart_dif, isFlat_hoz, isFlat_ver)

% global medGrayValue
medGrayValue = 127;

% RefImg_ori = RefImg;
% TestImg_ori = TestImg;

%%
RefImg = double(RefImg);
TestImg = double(TestImg);
RefImg = int8(RefImg - medGrayValue);
TestImg = int8(TestImg - medGrayValue);

[imgH, imgW] = size(RefImg);

dy_final_15 = [];
dx_final_15 = [];
dy_final_10 = [];
dx_final_10 = [];
dy_final_5 = [];
dx_final_5 = [];
dy_final_0 = [];
dx_final_0 = [];

count = 0;

%% search dx first
residualValue_final_15 = inf;
residualValue_final_10 = inf;
residualValue_final_5 = inf;
residualValue_final_0 = inf;
dy_range = -searchRange : 1 : searchRange;
dx_range = -searchRange : 1 : searchRange;
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
%         residualValue_15 = sum(diffImgAbs(diffImgAbs > 15));
%         residualValue_10 = sum(diffImgAbs(diffImgAbs > 10));
%         residualValue_5 = sum(diffImgAbs(diffImgAbs > 5));
% %         residualValue_15 = sum(sum(diffImgAbs > 15));
% %         residualValue_10 = sum(sum(diffImgAbs > 10));
% %         residualValue_5 = sum(sum(diffImgAbs > 5));
        residualValue_0 = sum(diffImgAbs(:));
%         if residualValue_15 < residualValue_final_15
%             residualValue_final_15 = residualValue_15;
%             dx_fianl_15 = dx;
%             dy_fianl_15 = dy;
%         end
%         if residualValue_10 < residualValue_final_10
%             residualValue_final_10 = residualValue_10;
%             dx_fianl_10 = dx;
%             dy_fianl_10 = dy;
%         end
%         if residualValue_5 < residualValue_final_5
%             residualValue_final_5 = residualValue_5;
%             dx_fianl_5 = dx;
%             dy_fianl_5 = dy;
%         end
        if residualValue_0 < residualValue_final_0
            residualValue_final_0 = residualValue_0;
            dx_fianl_0 = dx;
            dy_fianl_0 = dy;
        end
%         figure, imshow(diffImgDouble), pause(0.5), close all
    end
end

%%
% if residualValue_final_15 ~= 0
%     dx_center = dx_final_15;
%     dy_center = dy_final_15;
% elseif residualValue_final_10 ~= 0
%     dx_center = dx_final_10;
%     dy_center = dy_final_10;
% elseif residualValue_final_5 ~= 0
%     dx_center = dx_final_5;
%     dy_center = dy_final_5;
% else
%     dx_center = dx_final_0;
%     dy_center = dy_final_0;
% end

dx_center = dx_final_0;
dy_center = dy_final_0;

%%
dy_final = dy_center;
dx_final = dx_center;
% dy_final = [];
% dx_final = [];
% residualValue_final = inf;
% dy_range = dy_center - 1 : 1 : dy_center + 1;
% dx_range = dx_center - 1 : 1 : dx_center + 1;
% if isFlat_hoz
%     dx_range = 0;
% end
% if isFlat_ver
%     dy_range = 0;
% end
% for dy = dy_range
%     for dx = dx_range
%         count = count + 1;
%         diffImgDouble = circshift(TestImg, [dy, dx]) - RefImg;
%         diffImgDouble = Utility.replaceEdgeValue(diffImgDouble, removeRange, 0);
%         diffImgDouble(cropImageDarkPart_dil) = 0;
%         diffImgAbs = abs(diffImgDouble);
% %         diffImgAbs = diffImgDouble.^2;
%         
%         residualValue = sum(diffImgAbs(:));
% %         residualValue = sum(diffImgAbs(diffImgAbs >3));
% %         figure ,imshow(diffImgDouble), title(residualValue)
%         if residualValue < residualValue_final
%             residualValue_final = residualValue;
%             dx_final = dx;
%             dy_final = dy;
%         end
%     end
% end

% dy_final = dy_final_0;
% dx_final = dx_final_0;

% dy_fianl = dy_center;
% dx_final = dx_center;

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
diffImgDouble = diffImgDouble + medGrayValue;
diffImg_final = uint8(diffImgDouble);

end




















