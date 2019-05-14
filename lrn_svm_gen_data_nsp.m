clear;
close all;
clc
% Code for optimal Linear Classifier with separable patterns
% Generate Data
nD=2;
mn1=10*rand(1,nD);
mn2=0*rand(1,nD);
N1=30;
N2=32;
M1=ones(N1,1)*mn1;
M2=ones(N2,1)*mn2;
d=[ones(N1,1) ; -ones(N2,1)];

X1=randn(N1,2)+M1;
X2=randn(N2,2)+M2;
X=[X1;X2];

plot(X1(:,1),X1(:,2),'*',X2(:,1),X2(:,2),'o'),shg

save data1 X1 X2 X d
