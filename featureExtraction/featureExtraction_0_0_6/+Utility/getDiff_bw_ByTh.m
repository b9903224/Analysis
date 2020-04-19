function [T_diff_bw_ByTh, T_diff_bw_ByTh_plus, T_diff_bw_ByTh_minus, R_diff_bw_ByTh, R_diff_bw_ByTh_plus, R_diff_bw_ByTh_minus] =...
    getDiff_bw_ByTh(T_diff_true, R_diff_true, T_diff_abs_th, R_diff_abs_th]

% global medGrayValue
medGrayValue = 127;

%%
T_diff_bw_ByTh = (T_diff_true > medGrayValue + T_diff_abs_th) | (T_diff_true < medGrayValue - T_diff_abs_th);
T_diff_bw_ByTh_plus = T_diff_true > medGrayValue + T_diff_abs_th;
T_diff_bw_ByTh_minus = T_diff_true < medGrayValue - T_diff_abs_th;

R_diff_bw_ByTh = (R_diff_true > medGrayValue + R_diff_abs_th) | (R_diff_true < medGrayValue - R_diff_abs_th);
R_diff_bw_ByTh_plus = R_diff_true > medGrayValue + R_diff_abs_th;
R_diff_bw_ByTh_minus = R_diff_true < medGrayValue - R_diff_abs_th;

end