function srcImg = getHighLightImgByRange(destImg, srcImg, y_range, x_range, rgb, rgb_background)

[imgH_src, imgW_src, ~] = size(srcImg);
% [imgH_dest, imgW_dest] = size(destImg);

y_range = min(y_range(1), imgH_src) : min(y_range(end), imgH_src);
x_range = min(x_range(1), imgW_src) : min(x_range(end), imgW_src);

destImg = destImg(1 : numel(y_range), 1 : numel(x_range));

srcImg_sub = srcImg(y_range, x_range, :);

%%
destImg_inv = ~destImg;
for ch = 1 : 3
    srcImg_sub_ch = srcImg_sub(:, :, ch);
    srcImg_sub_ch(destImg) = rgb(ch);
    if ~isempty(rgb_background)
        srcImg_sub_ch(destImg_inv) = srcImg_sub_ch(destImg_inv) + rgb_background(ch);
    end
    
    srcImg_sub(:, :, ch) = srcImg_sub_ch;
end

%%
srcImg(y_range, x_range, :) = srcImg_sub;

end