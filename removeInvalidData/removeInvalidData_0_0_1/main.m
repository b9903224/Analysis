%%
warning('off', 'all');
close all
format compact
rng('shuffle');

%%
% currentPath = pwd;
parentPath = cd(cd('..'));
parentParentPath = fileparts(parentPath);
dataPath = fullfile(parentParentPath, 'data');

%%
scrFolder = 'F18 APMI07 2020.03';
destFolder = 'F18_APMI07_202003';

%%
srcPath = fullfile(dataPath, srcFolder);
destPath = fullfile(dataPath, destFolder);
Func.removeInvalidData(srcPath, destPath);


























