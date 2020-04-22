function Image = getDiffImageByDft(Image)

Image = AlignDiff.getFlatByDir(Image);

%%
searchRange = 4;
% usfac = 16;
usfac = 32;
% usfac = 2;

DftRegistration_T = Utility.getDftRegistration(Image.WorkImg.T_Ref_work, Image.WorkImg.T_Test_work, usfac, searchRange);
DftRegistration_R = Utility.getDftRegistration(Image.WorkImg.R_Ref_work, Image.WorkImg.R_Test_work, usfac, searchRange);
DftRegistration_T.diffImg = Utility.replaceEdgeValue(DftRegistration_T.diffImg, searchRange, 127);
DftRegistration_R.diffImg = Utility.replaceEdgeValue(DftRegistration_R.diffImg, searchRange, 127);

%%
diff_adv2 = struct;
diff_adv2.dy_final_T = DftRegistration_T.dy;
diff_adv2.dx_final_T = DftRegistration_T.dx;
diff_adv2.T_diff_true = DftRegistration_T.diffImg;

diff_adv2.dy_final_R = DftRegistration_R.dy;
diff_adv2.dy_final_R = DftRegistration_R.dy;
diff_adv2.R_diff_true = DftRegistration_R.diffImg;

%%
diff = diff_adv2;
diff_adv0 = diff_adv2;
diff_adv = diff_adv2;

%%
Image.diff = diff;
Image.diff_adv0 = diff_adv0;
Image.diff_adv = diff_adv;
Image.diff_adv2 = diff_adv2;

end




























