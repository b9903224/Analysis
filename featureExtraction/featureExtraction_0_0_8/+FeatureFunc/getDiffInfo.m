function Image = getDiffInfo(Image)

Image = FeatureParsing.getDiff_true(Image);
Image = FeatureParsing.getDIffByTh(Image);

%%
Image = FeatureParsing.getFalseDefect(Image);
% Image = FeatureParsing.getMinorDefect(Image);

%%
Image = FeatureParsing.getALlDefect(Image);

end