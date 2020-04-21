function noImageImg = getNoImageImg(imgH, imgW)

noImageImg = uint8(zeros(imgH, imgW));

%%
digitStringImg = Utility.getImgByString_24('No Image');
digitStringImg = imresize(digitStringImg, 2);
digitStringImg = uint8(digitStringImg) * 255;

%%
[imgH_dest, imgW_dest] = size(digitStringImg);
locY = round((imgH - imgH_dest) / 2);
locX = round((imgW - imgW_dest) / 2);

y_range = locY : locY + imgH_dest - 1;
x_range = locX : locX + imgW_dest - 1;

noImageImg(y_range, x_range) = digitStringImg;

end