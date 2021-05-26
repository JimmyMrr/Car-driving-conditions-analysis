clc;
clear;
close all;

data = xlsread('factor_score.xlsx');
[row, colume] = size(data);
for i = 1:row
    data(i,:);
end


% data = [0.697 0.460;0.774,0.376;0.634,0.264;0.608,0.318;0.556,0.215;0.403,0.237;
% 0.481,0.149;0.437,0.211;0.666,0.091;0.243,0.267;0.245,0.057;0.343,0.099;
% 0.639 0.161;0.657,0.198;0.360,0.370;0.593,0.042;0.719,0.103;0.359,0.188;
% % 0.339,0.241;0.282,0.257;0.748,0.232;0.714,0.346;0.483,0.312;0.478,0.437;
% 0.525,0.369;0.751,0.489;0.532,0.472;0.473,0.376;0.725,0.445;0.446,0.459;];

%聚类 数值初始化
% scatter(data(:,1),data(:,2))
% axis([0.1 0.9 0 0.8])
num = length(data); %样本数
fea_n= 5; %特征数
k = 3; %簇数


%如果各特征数值差异较大，需要归一化
% maxd = max(data,2);
% data(:,1:fea_n)=data(:,1:fea_n)./repmat(maxd(1,1:fea_n),num,1);
% totalMean = mean(data(:,1:fea_n));


%产生不相等随机数
b = randperm(num);
r = b(1:k);


%r = [6 12 24];%书中随机选取的初始化质心


%初始均值向量 u 1行 * k*fea_n列
u = [data(r(1,1),1:fea_n)];
for n = 2:k
u = [u , data(r(1,n),1:fea_n)];
end


count = 1;%迭代次数
flag = 1;
cellshape((1:k),1) = fea_n;


while(flag&&count<=4)
if count == 1 %第迭代循环初始化
    old_u = u;
end

difer = (repmat(data(:,1:fea_n),1,k) - repmat(old_u,num,1));
cell = mat2cell((difer.*difer),[num],cellshape); %按簇划分子块
distcell = cell2mat(cellfun(@(x) sum(x,2).^0.5, cell,'UniformOutput',false)'); %计算距离
dist=reshape(distcell,[],k);
[mini,lambda] = min(dist,[],2);%找到最近似的矩阵
data = [data(:,1:fea_n),lambda]; %标记数据
data = sortrows(data,3);


%各簇内记录的数量
for n = 1:k
len(1,n) = length(find(lambda==n));
end

datacell = mat2cell(data(:,1:fea_n)',(fea_n),len);
new_u = cell2mat(cellfun(@(x) mean(x,2),datacell,'UniformOutput',false)')';
flag = length(find(new_u-old_u~=0));
old_u = new_u;
count=count+1;
end


%画出分类结果
Color_map = hsv(k);
Label = data(:,fea_n+1);
Color_Label = Color_map(Label,:);

figure(1),clf
C=reshape(new_u',5,[])';

% plot(C(:,1),C(:,2),C(:,3),C(:,4),C(:,5),'kx','MarkerSize',10,'LineWidth'
plot(C(:,1),C(:,2),'kx','MarkerSize',10,'LineWidth',3)
hold on;
scatter(data(:,1),data(:,2),30,Color_Label,'filled')
xlabel('时间')
ylabel('速度')
title('第十轮迭代后')

