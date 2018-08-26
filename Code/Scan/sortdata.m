clc;clear;
% Bolin
load NRD.mat

pc = pointCloud(points);
%pcwrite(pc,'test','PLYFormat','ascii')
figure(3)
showPointCloud(pc);


%% sort along xyz axis
L = size(points,1);
X = points(:,3);
Y = points(:,1);
Z = points(:,2);

% first sort, along x axis
[sX1, sortIndex1] = sort(X);
sY1 = Y(sortIndex1);
sZ1 = Z(sortIndex1);

sXc1 = mat2cell(sX1',1,[2000 2000 2000 2000 2000 2000 2000 2000 2000 1347]);
sYc1 = mat2cell(sY1',1,[2000 2000 2000 2000 2000 2000 2000 2000 2000 1347]);
sZc1 = mat2cell(sZ1',1,[2000 2000 2000 2000 2000 2000 2000 2000 2000 1347]);


sYc2 = cell(1,10);sZc2 = cell(1,10);sXc2 = cell(1,10);
Xout = [];
Yout = [];
Zout = [];


for i1 = 1: 10
    % sort along y axis
    [sYc2{i1}, Index] = sort(sYc1{i1});
    sXc2{i1} = sXc1{i1}(Index);
    sZc2{i1} = sZc1{i1}(Index);
    
    L2 = size(sXc2{i1},2);
    size2 = ceil(L2/10);
    sXc22 = mat2cell(sXc2{i1},1,[ size2 size2 size2 size2 size2 size2 size2 size2 size2 L2-(9*size2)]);
    sYc22 = mat2cell(sYc2{i1},1,[ size2 size2 size2 size2 size2 size2 size2 size2 size2 L2-(9*size2)]);
    sZc22 = mat2cell(sZc2{i1},1,[ size2 size2 size2 size2 size2 size2 size2 size2 size2 L2-(9*size2)]);
    if i1 == 1 
        usex = sXc22;
        usey = sYc22;
        usez = sZc22;
    end
    
    
    for i2 = 1:10
        % sort along z axis
        [sZc3{i2}, Index2] = sort(sZc22{i2});
        sXc3{i2} = sXc22{i2}(Index2);
        sYc3{i2} = sYc22{i2}(Index2);
        Xout = [Xout; (sXc3{i2})'];
        Yout = [Yout; (sYc3{i2})'];
        Zout = [Zout; (sZc3{i2})'];
    end
end


%% find the yz min point on foot
[zmin, in] = min(usez{1});
xmin = usex{1}(1,in);
ymin = usey{1}(1,in);
% Normalize
Xout = Xout - xmin;
Yout = Yout - ymin;
Zout = Zout - zmin;
maxx = max(Xout)
% maxy = max(Yout)
% maxz = max(Zout)
% 
minx = min(Xout)
% miny = min(Yout)
% minz = min(Zout)

% xx = [sXc2{1}';sXc2{2}';sXc2{3}';sXc2{4}';sXc2{5}';sXc2{6}';sXc2{7}';sXc2{8}';sXc2{9}';sXc2{10}'];
% yy = [sYc2{1}';sYc2{2}';sYc2{3}';sYc2{4}';sYc2{5}';sYc2{6}';sYc2{7}';sYc2{8}';sYc2{9}';sYc2{10}'];
% zz = [sZc2{1}';sZc2{2}';sZc2{3}';sZc2{4}';sZc2{5}';sZc2{6}';sZc2{7}';sZc2{8}';sZc2{9}';sZc2{10}'];
bodyheight = 1850;
out = [Yout Zout Xout];
out = (out/(abs(maxx-minx)))*bodyheight;
pc2 = pointCloud(out);
figure(4)
showPointCloud(pc2);

[aa,bb] = size(out);
output16 = reshape(out,[1,aa * bb]);
% save(['D:\EDINBURGH\Projects\HumanShape\dataprocess\init-nrd-3\aftersort.mat'], 'output1');
save(['D:\EDINBURGH\Projects\HumanShape\dataprocess\init-nrd-3\aftersort.mat'], 'output16','-append');

fprintf('done\n');



