function [T_Test_work_shift, R_Test_work_shift] = getTest_work_shift(WorkImg, diff)

T_Test_work = WorkImg.T_Test_work;
R_Test_work = WorkImg.R_Test_work;

%%
dy_final_T = diff.dy_final_T;
dx_final_T = diff.dx_final_T;
dy_final_R = diff.dy_final_R;
dx_final_R = diff.dx_final_R;

%%
T_Test_work_shift = circshift(T_Test_work, [dy_final_T, dx_final_T]);
R_Test_work_shift = circshift(R_Test_work, [dy_final_R, dx_final_R]);

end