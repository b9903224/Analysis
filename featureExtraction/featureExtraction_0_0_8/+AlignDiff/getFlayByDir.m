function Image = getFlayByDir(Image)

WorkImg = Image.WorkImg;

T_Ref_work = WorkImg.T_Ref_work;
T_Test_work = WorkImg.T_Test_work;
R_Ref_work = WorkImg.R_Ref_work;
R_Test_work = WorkImg.R_Test_work;

%%
[isFlat_hoz_TR, isFlat_ver_TR] = judgeFlat(T_Ref_work);
[isFlat_hoz_TT, isFlat_ver_TT] = judgeFlat(T_Test_work);
[isFlat_hoz_RR, isFlat_ver_RR] = judgeFlat(R_Ref_work);
[isFlat_hoz_RT, isFlat_ver_RT] = judgeFlat(R_Test_work);

%%
isFLat_hoz = isFlat_hoz_TR | isFlat_hoz_TT | isFlat_hoz_RR | isFlat_hoz_RT;
isFLat_ver = isFlat_ver_TR | isFlat_ver_TT | isFlat_ver_RR | isFlat_ver_RT;

%%
FlatByDir = struct;
FlatByDir.isFLat_hoz = isFLat_hoz;
FlatByDir.isFLat_ver = isFLat_ver;

FlatByDir.isFlat_hoz_TR = isFlat_hoz_TR;
FlatByDir.isFlat_hoz_TT = isFlat_hoz_TT;
FlatByDir.isFlat_hoz_RR = isFlat_hoz_RR;
FlatByDir.isFlat_hoz_RT = isFlat_hoz_RT;

FlatByDir.isFlat_ver_TR = isFlat_ver_TR;
FlatByDir.isFlat_ver_TT = isFlat_ver_TT;
FlatByDir.isFlat_ver_RR = isFlat_ver_RR;
FlatByDir.isFlat_ver_RT = isFlat_ver_RT;

Image.FlatByDir = FlatByDir;

end

%%
function [isFlat_hoz_TR, isFlat_ver_TR] = judgeFlat(T_Ref_work)

% tic
isFlat_hoz_TR = judgeFlatHoz(T_Ref_work);
% toc
% tic
isFlat_ver_TR = judgeFlatHoz(rot90(T_Ref_work, 1));
% toc

end

%%
function isFlat_hoz_TR = judgeFlatHoz(T_Ref_work)

isFlat_hoz_TR = false;
T_Ref_work = double(T_Ref_work);
[imgH, ~] = size(T_Ref_work);

%%
% imgRow_diff_limit = 12;
imgRow_diff_limit = 16;
% imgRow_grad_abs_max_limit = 6;
imgRow_grad_abs_max_limit = 10;

imgRow_diffAry = zeros(imgH, 1);
imgRow_grad_abs_maxAry = zeros(imgH, 1);
for y = 1 : imgH
    imgRow = T_Ref_work(y, :);
    imgRow_max = max(imgRow);
    imgRow_min = min(imgRow);
    imgRow_diff = imgRow_max - imgRow_min;
    imgRow_diffAry(y) = imgRow_diff;
    if imgRow_diff > imgRow_diff_limit
        return
    end
    
%     imgRow_grad = gradient(imgRow);
    imgRow_grad = diff(imgRow);
    imgRow_grad_abs = abs(imgRow_grad);
    imgRow_grad_abs_max = max(imgRow_grad_abs);
    imgRow_grad_abs_maxAry(y) = imgRow_grad_abs_max;
    if imgRow_grad_abs_max >imgRow_grad_abs_max_limit
        return
    end
end

%%
isFlat_hoz_TR = true;

%%
% figure, plot(imgRow_diffAry)
% figure, plot(imgRow_grad_abs_maxAry)

end



















