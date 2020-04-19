function img = replaceEdgeValue(img, removeRange, edgeValue)

[imgH, imgW] = size(img);

%%
img(1 : removeRange, :) = edgeValue;
img(imgH - removeRange : imgH, :) = edgeValue;
img(:, 1 : removeRange) = edgeValue;
img(:, imgW - removeRange + 1 : imgW) = edgeValue;

end