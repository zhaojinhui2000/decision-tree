%****************************************
%main.m
%****************************************
clear,clc
[~,data] = xlsread('data.xlsx',3)       %�������ݼ�
[~,feature] = xlsread('feature.xlsx')   %�������Լ�
Node = createTree(data, feature);       %���ɾ�����
drawTree(Node)                          %���ƾ�����

 

