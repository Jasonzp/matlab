clear;clc;
cd 'C:\Users\lenovo\Desktop\应用一：分析产业对GDP的影响程度'
load gdp.mat
[r,c]=size(gdp);% 先把矩阵的大小size（出来）
A=gdp./(sum(gdp,1)/r);%首先先对变量进行预处理，将每个数据除以该列的均值
B=abs(A(1:end,2:end)-repmat(A(:,1),1,c-1));%算出abs（x0-x1）
a=repmat(min(B(:)),r,c-1);
b=repmat(max(B(:)),r,c-1);% 找出系数a，b
rho=0.5;%定义分辨系数，一般取值为0.5
P=((repmat(rho,r,c-1)).*b+a)./(B+(repmat(rho,r,c-1)).*b);

disp('现在计算三大产业的灰色关联度：');
disp('第一产业与经济GDP的灰色关联度为：')
X=mean(P(:,1))% 对矩阵求算数平均值
disp('第二产业与经济GDP的灰色关联度为：')
Y=mean(P(:,2))
disp('第三产业与经济GDP的灰色关联度为：')
Z=mean(P(:,3))

if X>Y
   if X>Z
       disp('X的灰色关联度最高，第一产业对GDP影响最大！')
   elseif X<Z
       disp('Z的灰色关联度最高，第三产业对GDP影响最大！')
   end
elseif X<Y
    if Y>Z
       disp('Y的灰色关联度最高，第二产业对GDP影响最大！')
   elseif Y<Z
       disp('Z的灰色关联度最高，第三产业对GDP影响最大！')
   end
end

    
