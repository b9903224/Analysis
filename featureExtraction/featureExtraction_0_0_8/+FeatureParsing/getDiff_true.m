function Image = getDiff_true(Image)

T_diff_true = Image.diff_adv2.T_diff_true;
R_diff_true = Image.diff_adv2.R_diff_true;

%%
Image.T_diff_true = T_diff_true;
Image.R_diff_true = R_diff_true;

end