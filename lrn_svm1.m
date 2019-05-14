clear;
close all;
clc;

% SVM Separable patterns
% load data 
load data1
N=size(X,1);
M=randperm(N);
X=X(M,:);

d=d(M);

% Construct the SVM use quadprog 1/2*x'*H*x + f'*x. 

f=-ones(N,1);
for m=1:N
    for n=1:N
        H(m,n)=d(m)*d(n)*(X(m,:)*X(n,:)');
    end
end

% Construct the contsraints
% equality constraints Ae.x=be
be=0;  Ae=d';

% inequality constraints Ax<b 
A=[],b=[];
Lb=zeros(N,1);
Ub=Lb+1;

alfa0=0.0001*rand(N,1);

alf_opt=quadprog(H,f,A,b,Ae,be,Lb,Ub);
bar(alf_opt),shg

wo=0;
for k=1:N
wo=wo+alf_opt(k)*d(k)*X(k,:);
end


indx=find(alf_opt>eps);
b=d(indx(1))-wo*X(indx(1),:)';
plot(X1(:,1),X1(:,2),'*',X2(:,1),X2(:,2),'+',X(indx,1),X(indx,2),'o','MarkerSize',12),shg
hold on
xT=linspace(1.5*min(X(:)),1.5*max(X(:)),1000);
yT=(-b-wo(1)*xT)/wo(2);

plot(xT,yT,'LineWidth',2)





