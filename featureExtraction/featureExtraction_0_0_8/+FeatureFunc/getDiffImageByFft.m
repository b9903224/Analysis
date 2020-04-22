function Image = getDiffImageByFft(Image)

Image = AlignDiff.getFlayByDir(Image);
hasPattern = Image.hasPattern;

%%
searchRange = 4;
removeRange = 6;
cropImageDarkPart_dil = imdilate(Image.cropImageDarkPart, strel('square', 5));

diff = getDiffCoarse(Image, searchRange, removeRange, cropImageDarkPart_dil);

%%
removeRange = 6;
if hasPattern
    [diff_adv0, diff_adv, diff_adv2] = getDiffAdv(Image, diff, removeRange);
else
    diff_adv0 = diff;
    diff_adv = diff;
    diff_adv2 = diff;
end

%%
[T_Test_work_shift, R_Test_work_shift] = AlignDiff.getTest_work_shift(Image.WorkImg, diff);

%%
Image.diff = diff;
Image.diff_adv0 = diff_adv0;
Image.diff_adv = diff_adv;
Image.diff_adv2 = diff_adv2;

Image.T_Test_work_shift = T_Test_work_shift;
Image.R_Test_work_shift = R_Test_work_shift;

end

%%
function [diff_adv0, diff_adv, diff_adv2] = getDiffAdv(Image, diff, removeRange)

T_Ref_work = Image.T_Ref_work;
T_Test_work = Image.T_Test_work;
R_Ref_work = Image.R_Ref_work;
R_Test_work = Image.R_Test_work;

T_Ref_work = im2double(T_Ref_work);
T_Test_work = im2double(T_Test_work);
R_Ref_work = im2double(R_Ref_work);
R_Test_work = im2double(R_Test_work);

%%
usfac = 2;
[diff_adv0.dy_final_T, diff_adv0.dx_fianl_T, diff_adv0.T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, diff.dy_final_T, diff.dx_final_T, removeRange);
[diff_adv0.dy_final_R, diff_adv0.dx_fianl_R, diff_adv0.R_diff_true] = getDiffAdvByFFT(R_Ref_work, R_Test_work, usfac, diff.dy_final_R, diff.dx_final_R, removeRange);

usfac = 4;
[diff_adv.dy_final_T, diff_adv.dx_fianl_T, diff_adv.T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, diff_adv0.dy_final_T, diff_adv0.dx_final_T, removeRange);
[diff_adv.dy_final_R, diff_adv.dx_fianl_R, diff_adv.R_diff_true] = getDiffAdvByFFT(R_Ref_work, R_Test_work, usfac, diff_adv0.dy_final_R, diff_adv0.dx_final_R, removeRange);

usfac = 8;
[diff_adv2.dy_final_T, diff_adv2.dx_fianl_T, diff_adv2.T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, diff_adv.dy_final_T, diff_adv.dx_final_T, removeRange);
[diff_adv2.dy_final_R, diff_adv2.dx_fianl_R, diff_adv2.R_diff_true] = getDiffAdvByFFT(R_Ref_work, R_Test_work, usfac, diff_adv.dy_final_R, diff_adv.dx_final_R, removeRange);

usfac = 16;
[diff_adv3.dy_final_T, diff_adv3.dx_fianl_T, diff_adv3.T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, diff_adv2.dy_final_T, diff_adv2.dx_final_T, removeRange);
[diff_adv3.dy_final_R, diff_adv3.dx_fianl_R, diff_adv3.R_diff_true] = getDiffAdvByFFT(R_Ref_work, R_Test_work, usfac, diff_adv2.dy_final_R, diff_adv2.dx_final_R, removeRange);

usfac = 32;
[diff_adv4.dy_final_T, diff_adv4.dx_fianl_T, diff_adv4.T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, diff_adv3.dy_final_T, diff_adv3.dx_final_T, removeRange);
[diff_adv4.dy_final_R, diff_adv4.dx_fianl_R, diff_adv4.R_diff_true] = getDiffAdvByFFT(R_Ref_work, R_Test_work, usfac, diff_adv3.dy_final_R, diff_adv3.dx_final_R, removeRange);

diff_final = diff_adv4;

diff_adv0 = diff_final;
diff_adv = diff_final;
diff_adv2 = diff_final;

end

%%
function diff = getDiffCoarse(Image, searchRange, removeRange, cropImageDarkPart_dil)

T_Ref_work = Image.T_Ref_work;
T_Test_work = Image.T_Test_work;
R_Ref_work = Image.R_Ref_work;
R_Test_work = Image.R_Test_work;

FlatByDir = Image.FlatByDir;
isFlat_hoz = FlatByDir.isFlat_hoz;
isFlat_ver = FlatByDir.isFlat_ver;

[diff.dy_final_T, diff.dx_final_T, diff.T_diff_true] = AlignDiff.getDiffImg_coarse(T_Ref_work, T_Test_work, searchRange, removeRange, cropImageDarkPart_dif, isFlat_hoz, isFlat_ver);
[diff.dy_final_R, diff.dx_final_R, diff.R_diff_true] = AlignDiff.getDiffImg_coarse(R_Ref_work, R_Test_work, searchRange, removeRange, cropImageDarkPart_dif, isFlat_hoz, isFlat_ver);

diff.resizeRatio = 1;
diff.removeRange = removeRange;

end

%%
function [dy_final_T, dx_final_T, T_diff_true] = getDiffAdvByFFT(T_Ref_work, T_Test_work, usfac, dy_final_T_ori, dx_final_T_ori, removeRange);

phase = 2;
[nr,nc]=size(T_Ref_work);
Nr = ifftshift((-fix(nr/2):ceil(nr/2)-1));
Nc = ifftshift((-fix(nc/2):ceil(nc/2)-1));
[Nc,Nr] = meshgrid(Nc,Nr);

%%
dy_final_T = [];
dx_final_T = [];
T_diff_true = [];
searchRange = 1/usfac;
dy_range = -searchRange + dy_final_T_ori : searchRange : searchRange + dy_final_T_ori;
dx_range = -searchRange + dx_final_T_ori : searchRange : searchRange + dx_final_T_ori;
residualValue_final = inf;
for dy = dy_range
    for dx = dx_range
        deltar = -dy;
        deltac = -dx;
        T_Test_work_shift = ifft2(fft2(T_Test_work).*exp(1i*2*pi*(deltar*Nr/nr+deltac*Nc/nc))).*exp(-1i*phase);
        T_Test_work_shift = abs(T_Test_work_shift);
        diffImg = T_Test_work_shift - T_Ref_work;
        diffImg = Utility.replaceEdgeValue(diffImg, removeRange, 0);
        diffImgAbs = abs(diffImg);
        residualValue = sum(diffImgAbs(:));
        if residualValue < residualValue_final
            residualValue_final = residualValue;
            dy_final_T = dy;
            dx_final_T = dx;
            T_diff_true = diffImg;
        end
    end
end

T_diff_true = uint8(T_diff_true * 255 + 127);

end

























