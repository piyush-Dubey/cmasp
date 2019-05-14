% Kernelized implementation of optimal linear classifier

load data1
N = size(X, 1);
M = randperm(N);
X = X(M,:);

d = d(M);

% Construct the SVM use quadprog 1/2*x'*H*x + f'*x
H = zeros(N, N);
f = -ones(N, 1);
sigma = 1;
for m=1:N
    for n=1:N
        H(m,n) = d(m) * d(n) * gaussianKernel(X(m,:), X(n, :), sigma);
    end
end

be = 0;
Ae = d';

A = []; b = [];
Lb = zeros(N, 1);
C = 0.1;
Ub = Lb + C;
alfa0 = rand(N, 1);

alfa_opt = quadprog(H, f, A, b,Ae, be,Lb, Ub);
bar(alfa_opt);
shg;

wo = 0;
for k=1:N
    wo = wo + alfa_opt(k)*d(k)* X(k,:);
end

figure;
indx = find(alfa_opt > eps);
b = d(indx(1)) - wo * X(indx(1), :)' ;
plot(X1(:,1), X1(:,2), '*', X2(:,1), X2(:,2), '+', X(indx(1),1), X(indx(1),2), 'o', 'MarkerSize', 12); shg;
hold on;
xT = linspace(1.5 * min(X(:)), 1.5 * max(X(:)), 1000);
yT = (-b - wo(1) * xT) / wo(2);

plot(xT, yT, 'LineWidth',2);