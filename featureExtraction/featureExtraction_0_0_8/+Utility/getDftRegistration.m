function DftRegistration = getDftRegistration(refImg, defectImg, usfac, searchRange)

% edgeValue = 0;
edgeValue = 127;

%%
refImg_double = im2double(refImg);
defectImg_double = im2double(defectImg);

refImg_double_fft2 = fft2(refImg_double);
defectImg_double_fft2 = fft2(defectImg_double);

%%
[output, Greg] = Utility.dftregistration(refImg_double_fft2, defectImg_double_fft2, usfac, searchRange);

shiftError = output(1);
diffPhase = output(2);
dy = output(3);
dx = output(4);

%%
defectImgShift = uint8(abs(ifft2(Greg) * 255));
defectImgShift = replaceShiftEdge(defectImgShift, dy, dx, edgeVallue);

%%
diffImg = uint8(double(defectImgShift) - double(refImg) + 127);
diffImg = replaceShiftEdge(diffImg, dy, dx, edgeValue);

%%
% figure, imshow(defectImgShift), title(sprintf('defectImgShift : dy: %g, dx: %g', dy, dx))
% figure, imshow(diffImg), title('diffImg')
% imwrite(diffImg, 'diffImg.png')

%%
DftRegistration = struct;

DftRegistration.shiftError = shiftError;
DftRegistration.diffPhase = diffPhase;
DftRegistration.dy = dy;
DftRegistration.dx = dx;

DftRegistration.defectImgShift = defectImgShift;
DftRegistration.diffImg = diffImg;

end

%%
function img = replaceShiftEdge(img, dy, dx, edgeValue)

[imgH, imgW] = size(img);

dy_shift_pixel = cell(abs(dy));
dx_shift_pixel = cell(abs(dx));

%%
if dy > 0
    img(1 : dy_shift_pixel, :) = edgeValue;
elseif dy < 0
    img(imgH - dy_shift_pixel + 1 : imgH, :) = edgeValue;
end

if dx > 0
    img(:, 1 : dx_shift_pixel) = edgeValue;
elseif dx < 0
    img(:, imgW - dx_shift_pixel + 1 : imgW) = edgeValue;
end

end



