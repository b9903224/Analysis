function stringAryImg = getImgByString(inputStringAry)

inputStringAryLen = numel(inputStringAry);

%%
stringImgCell = cell(inputStringAryLen, 1);
for i = 1 : inputStringAryLen
    inputString = inputStringAry(i);
    stringImg = getStringImg(inputString);
    stringImgCell{i} = stringImg;
end

stringAryImg = cell2mat(stringImgCell');

%%
% stringAry = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`~!@#$%^&*()-_=+[{]}\|;:",<.>/?''';
% 
% close all
% imgH = 12;
% imgW = 12;
% tempImg = zeros(imgH, imgW);
% tempImg = uint8(tempImg);
% 
% % stringAry = 'r';
% % stringAry = unique(stringAry);
% stringAryLen = numel(stringAry);
% for i = 1 : stringAryLen
%     textStr = stringAry(i);
%     img = insertText(tempImg, [0,-2], textStr, 'fontsize', 10, 'BoxOpacity', 1, 'TextColor', 'white', 'boxcolor', 'black');
%     img = img(:,:,1);
%     img = img > 127;
%     indices = find(img);
%     fprintf('elseif strcmp(inputString, ''%s'')\n', textStr);
%     fprintf('\tindices = [');
%     for j = 1 : numel(indices)
%         fprintf('%g', indices(j))
%         if j~= numel(indices)
%             fprintf(';')
%         end
%     end
%     fprintf('];\n')
% %     figure, imshow(img)
% end

end

%%
function stringImg = getStringImg(inputString)

imgH = 12;
imgW = 12;
stringImg = false(imgH, imgW);

%%
if strcmp(inputString, ' ')
    imgH = 12;
    imgW = 3;
    stringImg = false(imgH, imgW);
    return;
end

%%
if false
elseif strcmp(inputString, 'a')
	indices = [41;44;45;53;55;58;65;67;70;78;79;80;81;82;94];
elseif strcmp(inputString, 'b')
	indices = [39;40;41;42;43;44;45;46;53;58;65;70;78;79;80;81];
elseif strcmp(inputString, 'c')
	indices = [42;43;44;45;53;58;65;70];
elseif strcmp(inputString, 'd')
	indices = [42;43;44;45;53;58;65;70;75;76;77;78;79;80;81;82];
elseif strcmp(inputString, 'e')
	indices = [42;43;44;45;53;55;58;65;67;70;78;79;82];
elseif strcmp(inputString, 'f')
	indices = [29;40;41;42;43;44;45;46;51;53;63];
elseif strcmp(inputString, 'g')
	indices = [42;43;44;45;48;53;58;60;65;70;72;77;78;79;80;81;82;83];
elseif strcmp(inputString, 'h')
	indices = [39;40;41;42;43;44;45;46;65;78;79;80;81;82];
elseif strcmp(inputString, 'i')
	indices = [39;41;42;43;44;45;46];
elseif strcmp(inputString, 'j')
	indices = [24;36;39;41;42;43;44;45;46;47];
elseif strcmp(inputString, 'k')
	indices = [39;40;41;42;43;44;45;46;55;68;78;81;89;94];
elseif strcmp(inputString, 'l')
	indices = [39;40;41;42;43;44;45;46];
elseif strcmp(inputString, 'm')
	indices = [41;42;43;44;45;46;54;65;78;79;80;81;82;90;101;113;114;115;116;117;118];
elseif strcmp(inputString, 'n')
	indices = [41;42;43;44;45;46;65;78;79;80;81;82];
elseif strcmp(inputString, 'o')
	indices = [42;43;44;45;53;58;65;70;78;79;80;81];
elseif strcmp(inputString, 'p')
	indices = [41;42;43;44;45;46;47;48;53;58;65;70;78;79;80;81];
elseif strcmp(inputString, 'q')
	indices = [42;43;44;45;53;58;65;70;77;78;79;80;81;82;83;84];
elseif strcmp(inputString, 'r')
	indices = [41;42;43;44;45;46;65];
elseif strcmp(inputString, 's')
	indices = [42;46;53;55;58;65;68;69];
elseif strcmp(inputString, 't')
	indices = [29;40;41;42;43;44;45;53;58];
elseif strcmp(inputString, 'u')
	indices = [41;42;43;44;45;58;77;78;79;80;81;82];
elseif strcmp(inputString, 'v')
	indices = [29;30;43;44;45;57;58;67;68;69;77;78];
elseif strcmp(inputString, 'w')
	indices = [29;30;31;44;45;46;54;55;56;65;66;78;79;80;92;93;94;101;102;103;104];
elseif strcmp(inputString, 'x')
	indices = [29;34;42;45;55;56;66;69;77;82];
elseif strcmp(inputString, 'y')
	indices = [29;30;43;44;48;57;58;59;67;68;77;78];
elseif strcmp(inputString, 'z')
	indices = [41;45;46;53;56;58;65;67;70;77;78;82];
elseif strcmp(inputString, 'A')
	indices = [34;43;44;45;52;53;54;56;63;64;68;76;77;78;80;91;92;93;106];
elseif strcmp(inputString, 'B')
	indices = [39;40;41;42;43;44;45;46;51;54;58;63;66;70;76;77;79;80;81];
elseif strcmp(inputString, 'C')
	indices = [41;42;43;44;52;57;63;70;75;82;87;94];
elseif strcmp(inputString, 'D')
	indices = [39;40;41;42;43;44;45;46;51;58;63;70;76;81;89;90;91;92];
elseif strcmp(inputString, 'E')
	indices = [39;40;41;42;43;44;45;46;51;54;58;63;66;70;75;82];
elseif strcmp(inputString, 'F')
	indices = [39;40;41;42;43;44;45;46;51;55;63;67];
elseif strcmp(inputString, 'G')
	indices = [41;42;43;44;52;57;63;70;75;82;87;91;92;93;94];
elseif strcmp(inputString, 'H')
	indices = [39;40;41;42;43;44;45;46;54;66;78;87;88;89;90;91;92;93;94];
elseif strcmp(inputString, 'I')
	indices = [39;40;41;42;43;44;45;46];
elseif strcmp(inputString, 'J')
	indices = [23;35;39;40;41;42;43;44;45;46];
elseif strcmp(inputString, 'K')
	indices = [39;40;41;42;43;44;45;46;54;65;67;76;80;87;93;106];
elseif strcmp(inputString, 'L')
	indices = [39;40;41;42;43;44;45;46;58;70;82];
elseif strcmp(inputString, 'M')
	indices = [39;40;41;42;43;44;45;46;52;53;66;67;68;80;81;90;91;92;100;101;111;112;113;114;115;116;117;118];
elseif strcmp(inputString, 'N')
	indices = [39;40;41;42;43;44;45;46;52;53;66;67;80;81;87;88;89;90;91;92;93;94];
elseif strcmp(inputString, 'O')
	indices = [41;42;43;44;52;57;63;70;75;82;88;93;101;102;103;104];
elseif strcmp(inputString, 'P')
	indices = [39;40;41;42;43;44;45;46;51;55;63;67;75;79;88;89;90];
elseif strcmp(inputString, 'Q')
	indices = [41;42;43;44;52;57;63;70;75;82;88;93;94;101;102;103;104;107;119];
elseif strcmp(inputString, 'R')
	indices = [39;40;41;42;43;44;45;46;51;55;63;67;68;76;77;78;81;94];
elseif strcmp(inputString, 'S')
	indices = [28;29;34;39;42;46;51;55;58;63;68;69];
elseif strcmp(inputString, 'T')
	indices = [27;39;51;52;53;54;55;56;57;58;63;75];
elseif strcmp(inputString, 'U')
	indices = [39;40;41;42;43;44;45;58;70;82;87;88;89;90;91;92;93];
elseif strcmp(inputString, 'V')
	indices = [27;40;41;42;55;56;57;69;70;79;80;81;88;89;90;99];
elseif strcmp(inputString, 'W')
	indices = [27;28;41;42;43;44;56;57;58;65;66;67;68;75;76;77;89;90;91;92;104;105;106;113;114;115;116;123;124];
elseif strcmp(inputString, 'X')
	indices = [27;34;40;41;44;45;54;55;64;65;68;69;75;82];
elseif strcmp(inputString, 'Y')
	indices = [27;40;41;54;55;56;57;58;64;65;75];
elseif strcmp(inputString, 'Z')
	indices = [39;45;46;51;55;56;58;63;65;66;70;75;76;82];
elseif strcmp(inputString, '0')
	indices = [40;41;42;43;44;45;51;58;63;70;76;77;78;79;80;81];
elseif strcmp(inputString, '1')
	indices = [40;46;51;52;53;54;55;56;57;58;70];
elseif strcmp(inputString, '2')
	indices = [40;45;46;51;56;58;63;67;70;76;77;78;82];
elseif strcmp(inputString, '3')
	indices = [39;46;51;54;58;63;66;70;76;77;79;80;81];
elseif strcmp(inputString, '4')
	indices = [31;32;42;44;52;53;56;63;64;65;66;67;68;69;70;80];
elseif strcmp(inputString, '5')
	indices = [39;40;41;42;46;51;54;58;63;66;67;70;75;79;80;81];
elseif strcmp(inputString, '6')
	indices = [41;42;43;44;45;51;52;54;58;63;66;70;75;79;80;81];
elseif strcmp(inputString, '7')
	indices = [39;45;46;51;55;56;63;65;66;75;76];
elseif strcmp(inputString, '8')
	indices = [40;41;43;44;45;51;54;58;63;66;70;76;77;79;80;81];
elseif strcmp(inputString, '9')
	indices = [40;41;42;46;51;55;58;63;67;69;70;76;77;78;79;80;81];
elseif strcmp(inputString, '`')
	indices = [64];
elseif strcmp(inputString, '~')
	indices = [43;44;55;68;79;80];
elseif strcmp(inputString, '!')
	indices = [39;40;41;42;43;44;46];
elseif strcmp(inputString, '@')
	indices = [30;31;32;41;45;52;55;56;58;63;66;68;70;75;77;79;82;87;89;90;91;92;94;99;101;104;112;116;125;126;127];
elseif strcmp(inputString, '#')
	indices = [29;32;33;34;41;42;43;44;51;52;53;56;57;58;65;66;67;68;75;76;77;80;89;92];
elseif strcmp(inputString, '$')
	indices = [28;29;34;39;42;46;50;51;52;53;54;55;56;57;58;59;63;67;70;75;80;81];
elseif strcmp(inputString, '%')
	indices = [28;29;34;39;42;45;52;53;56;66;67;77;80;81;88;91;94;99;104;105];
elseif strcmp(inputString, '^')
	indices = [43;53;54;63;64;77;78;91];
elseif strcmp(inputString, '&')
	indices = [43;44;45;52;53;54;58;63;66;67;68;70;76;77;80;81;82;91;92;94];
elseif strcmp(inputString, '*')
	indices = [29;42;52;53;66;77];
elseif strcmp(inputString, '(')
	indices = [41;42;43;44;45;52;58];
elseif strcmp(inputString, ')')
	indices = [28;34;41;42;43;44;45];
elseif strcmp(inputString, '-')
	indices = [44;56;68;80];
elseif strcmp(inputString, '_')
	indices = [35;47;59;71;83];
elseif strcmp(inputString, '=')
	indices = [43;45;55;57;67;69;79;81;91;93;103;105];
elseif strcmp(inputString, '+')
	indices = [31;43;55;64;65;66;67;68;69;70;79;91;103];
elseif strcmp(inputString, '[')
	indices = [39;40;41;42;43;44;45;46;47;51;59];
elseif strcmp(inputString, '{')
	indices = [31;40;41;42;44;45;46;51;59];
elseif strcmp(inputString, ']')
	indices = [27;35;39;40;41;42;43;44;45;46;47];
elseif strcmp(inputString, '}')
	indices = [27;35;40;41;42;44;45;46;55];
elseif strcmp(inputString, '\')
	indices = [39;40;41;54;55;56;69;70;71];
elseif strcmp(inputString, '|')
	indices = [39;40;41;42;43;44;45;46;47];
elseif strcmp(inputString, ';')
	indices = [36;41;46;47];
elseif strcmp(inputString, ':')
	indices = [41;46];
elseif strcmp(inputString, '"')
	indices = [27;28;51;52];
elseif strcmp(inputString, ',')
	indices = [36;46;47];
elseif strcmp(inputString, '<')
	indices = [56;67;68;69;79;81;91;93;102;106];
elseif strcmp(inputString, '.')
	indices = [46];
elseif strcmp(inputString, '>')
	indices = [42;46;55;57;67;69;79;80;81;92];
elseif strcmp(inputString, '/')
	indices = [45;46;47;54;55;56;63;64;65];
elseif strcmp(inputString, '?')
	indices = [27;39;43;44;46;51;54;64;65];
elseif strcmp(inputString, '''')
	indices = [27;28];
else
    stringImg(:) = true;
    return;
end

stringImg(indices) = true;

%%
[~, X] = ind2sub([imgH, imgW], indices);
X_min = min(X);
X_max = max(X);

x_range = max(X_min - 1, 1) : min(X_max + 1, imgW);
stringImg = stringImg(:, x_range);

end

