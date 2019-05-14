% Data generation for kernelized optimal linear classifier with separable patterns using SVM

nD = 2;
mn1 = 10 * rand(1, nD);
mn2 = 0 * rand(1, nD);
N = 20;
M1 = ones(N, 1) * mn1;
M2 = ones(N, 1) * mn2;
% M3 = ones(N, 1) * mn3;
d = [ones(N, 1); -ones(N, 1)];

X00 = randn(N, 2) + M1;
X01 = randn(N, 2) + M2;
X = [X00; X01];

plot(X00(:,1), X00(:,2), '*', X01(:,1), X01(:,2), 'o'), shg;
save data2 X d X00 X01;