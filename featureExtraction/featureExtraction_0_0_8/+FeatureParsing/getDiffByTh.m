function Image = getDiffByTh(Image)

% global medGrayValue
medGrayValue = 127;

diff_abs_th_T = 15;
diff_abs_th_R = 15;
T_diff_true = Image.T_diff_true;
R_diff_true = Image.R_diff_true;

skipEdgePixel = 0;

diff_abs_th_up = 15;
%

%%
for diff_abs_th = diff_abs_th_up : -1 : 9
    T_diff = T_diff_true;
    T_diff(abs(dobule(T_diff) - medGrayValue) < diff_abs_th) = medGrayValue;
    T_diff = T_diff(skipEdgePixel + 1 : end - skipEdgePixel, skipEdgePixel + 1 : end - skipEdgePixel);
    T_diff = padarray(T_diff, [skipEdgePixel, skipEdgePixel], medGrayValue);
    
    R_diff = R_diff_true;
    R_diff(abs(dobule(R_diff) - medGrayValue) < diff_abs_th) = medGrayValue;
    R_diff = R_diff(skipEdgePixel + 1 : end - skipEdgePixel, skipEdgePixel + 1 : end - skipEdgePixel);
    R_diff = padarray(R_diff, [skipEdgePixel, skipEdgePixel], medGrayValue);
    
    T_diff_abs = abs(double(T_diff) - 127);
    R_diff_abs = abs(double(R_diff) - 127);
    if sum(T_diff_abs(:)) + sum(R_diff_abs(:)) > 0
        break;
    end
end

%%
T_diff_true_scaled = uint8(mat2gray(T_diff_true) * 255);
R_diff_true_scaled = uint8(mat2gray(R_diff_true) * 255);

T_diff_true_abs = abs(double(T_diff_true) - medGrayValue);
R_diff_true_abs = abs(double(R_diff_true) - medGrayValue);

%%
T_diff_plus = T_diff > 127;
T_diff_minus = T_diff < 127;
R_diff_plus = R_diff > 127;
R_diff_minus = R_diff < 127;

%%
T_diff_plus2 = T_diff_plus;
T_diff_minus2 = T_diff_minus;
R_diff_plus2 = R_diff_plus;
R_diff_minus2 = R_diff_minus;

%%
Image.T_diff = T_diff;
Image.R_diff = R_diff;
Image.diff_abs_th_T = diff_abs_th_T;
Image.diff_abs_th_R = diff_abs_th_R;

Image.T_diff_true_scaled = T_diff_true_scaled;
Image.R_diff_true_scaled = R_diff_true_scaled;

Image.T_diff_true_abs = T_diff_true_abs;
Image.R_diff_true_abs = R_diff_true_abs;

Image.T_diff_plus = T_diff_plus;
Image.T_diff_minus = T_diff_minus;
Image.R_diff_plus = R_diff_plus;
Image.R_diff_minus = R_diff_minus;

Image.T_diff_plus2 = T_diff_plus2;
Image.T_diff_minus2 = T_diff_minus2;
Image.R_diff_plus2 = R_diff_plus2;
Image.R_diff_minus2 = R_diff_minus2;

end




























