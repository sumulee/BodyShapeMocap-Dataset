%%
clc;clear;
load aftersort.mat

data = [output1;output2;output3;output4;output5;output6;output7;output8;output9;
    output10;output11;output12;output13;output14;output15;output16];

totalSamples = size(data,1);
dimensions = size(data,2);

Numpoints = dimensions/3;
c = sort(randperm(Numpoints));
b = [];
for i=1:9000
    d = c(i)*3-2;
    b = [b data(:,d) data(:,d+1) data(:,d+2)];
end
data = b;
%%
[n m] = size(data);
AMean = mean(data);
AStd = std(data);
%B = (data - repmat(AMean,[n 1])) ./ repmat(AStd,[n 1]);
B = zscore(data);
[V D] = eig(cov(B));
[COEFF SCORE LATENT] = pca(B);








%% PCA
% [coeff,score,latent,tsquared,explained] = pca(data);









fprintf('done\n');