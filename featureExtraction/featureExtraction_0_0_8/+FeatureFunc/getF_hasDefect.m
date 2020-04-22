function FeatureResult = getF_hasDefect(Image, FeatureResult)

f_hasDefect = 0;
allDefect2 = Image.allDefect2;

%%
if any(allDefect2(:) == true)
    f_hasDefect = 1;
end

%%
FeatureResult.f_hasDefect = f_hasDefect;

end