function textAllImg_rgb = insertTextByStringImgH(position, text_str, testAllImg, stringImgH, rgb, rgb_background)

text_strLen = numel(text_str);
[imgH, imgW, ~] = size(testAllImg);

textImgAll = false(imgH, imgW);

%%
textImgAll_background = false(imgH, imgW);
hasBackgroundColor = false;
if any(rgb_background)
    hasBackgroundColor = true;
end

%%
stringImgH_base = 12;
if stringImgH >= 24
    stringImgH_base = 24;
end

textRatio = round(stringImgH/stringImgH_base);

%%
% tic
for i = 1 : text_strLen
    if stringImgH_base == 12
        stringAryImg = Utility.getImgByString(text_str{i});
    else
        stringAryImg = Utility.getImgByString_24(text_str{i});
    end
    if textRatio ~= 1
        stringAryImg = imresize(stringAryImg, textRatio, 'nearest');
    end
    
    locX = position(i, 1);
    locY = position(i, 2);
    [imgH_dest, imgW_dest] = size(stringAryImg);
    x_range_src = locX : min(locX + imgW_dest - 1, imgW);
    y_range_src = locY : min(locY + imgH_dest - 1, imgH);
    x_range_dest = 1 : numel(x_range_src);
    y_range_dest = 1 : numel(y_range_src);
    
    stringAryImg_trimmed = stringAryImg(y_range_dest, x_range_dest);
    textImgAll(y_range_src, x_range_src) = stringAryImg_trimmed;
    
    if hasBackgroundColor
        textImgAll_background(y_range_src, x_range_src) = ~stringAryImg_trimmed;
    end
end
% toc

%%
textAllImg_rgb = Utility.getHighLightImg(textImgAll, textAllImg, rgb);

%%
if hasBackgroundColor
    textAllImg_rgb = insertBackgroundColor(textAllImg_rgb, textImgAll_background, rgb_background);
end

end

%%
function textAllImg_rgb = insertBackgroundColor(textAllImg_rgb, textImgAll_background, rgb_background)

textAllImg_rgb_R = textAllImg_rgb(:, :, 1);
textAllImg_rgb_G = textAllImg_rgb(:, :, 2);
textAllImg_rgb_B = textAllImg_rgb(:, :, 3);

textAllImg_rgb_R(textImgAll_background) = textAllImg_rgb_R(textImgAll_background) + rgb_background(1);
textAllImg_rgb_G(textImgAll_background) = textAllImg_rgb_G(textImgAll_background) + rgb_background(2);
textAllImg_rgb_B(textImgAll_background) = textAllImg_rgb_B(textImgAll_background) + rgb_background(3);

textAllImg_rgb = cat(3, textAllImg_rgb_R, textAllImg_rgb_G, textAllImg_rgb_B);

end


