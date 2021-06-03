%****************************************
%main.m
%****************************************
clear,clc
[~,data] = xlsread('data.xlsx',3)       %读入数据集
[~,feature] = xlsread('feature.xlsx')   %读入属性集
Node = createTree(data, feature);       %生成决策树
drawTree(Node)                          %绘制决策树

 

