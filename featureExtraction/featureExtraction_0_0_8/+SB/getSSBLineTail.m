function Image = getSSBLineTail(Image)

T_mainPattern = Image.T_mainPattern;
SB_darkSolid = Image.SB_darkSolid;
SB_darkSolid_inv = ~SB_darkSolid;
T_Ref_work = Image.T_Ref_work;
T_Ref_dark = T_Ref_work < 145;

[imgH, imgW] = size(SB_darkSolid);
SSBLineTail = true(imgH, imgW);

%%
CC = bwconncomp(SB_darkSolid_inv);

% 
CC_NumObjects_list = 600;

if CC.NumObjects <= CC_NumObjects_limit
    for label = 1 : CC.NumObjects
        PixelIdx = CC.PixelIdxList{label};
        [Y, X] = ind2sub(CC.ImageSize, PixelIdx);
        x_min = min(X);
        x_max = max(X);
        y_min = min(Y);
        y_max = max(Y);
        x_range = x_max - x_min + 1;
        y_range = y_max - y_min + 1;
        
        widthMin = min(x_range, y_range);
        widthMax = max(x_range, y_range);
        
        CC_part = false(imgH, imgW);
        CC_part(PixelIdx) = true;
        strelElement = [];
        if widthMax >= 4 && widthMin <= 4 && x_range ~= y_range
            strelElement = [0,0,0;1,1,1;0,0,0]; % horizon
            if x_range > y_range % horizon
            elseif y_range > x_range
                strelElement = strelElement';
            end
        elseif widthMax <= 4 && widthMin <= 4
            strelElement = [0,1,0;1,1,1;0,1,0];
        end
        if ~isempty(strelElement)
            CC_part_dil = imdilate(CC_part, strelElement) & T_mainPattern & T_Ref_dark;
            %
            SSBLineTail_part = CC_part_dil;
            SSBLineTail_part{PixelIdx) = false;
            SSBLineTail(SSBLineTail_part) = false;
        end
        
    end
end

SB_darkSolid(~SSBLineTail) = false;

%%
Image.SB_darkSolid = SB_darkSolid;
Image.SSBLineTail = SSBLineTail;

end


























