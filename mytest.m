%% 进行灰色关联分析用于评价类问题
clear;clc;
load data_water_quality.mat
[r,c]=size(X);
%% (1)首先对指标进行正向化
disp(['现在有',num2str(c),'个指标']);
  KEY=input('中间型指标最佳为：');
  a=input('区间型指标最佳下限为：');
  b=input('区间型指标最佳上限为：');
for i=1:c
    k=input(['第',num2str(i),'个指标的类型是','1-极大型指标，2-极小型指标，3-中间型指标，区间型指标']);
    if k==1
        disp('无需正向化，已经是极大型指标');
    elseif k==2
        disp(['第',num2str(i),'个指标是极小型'])
        X(:,i)=(max(X(:,i))-X(:,i));
    elseif k==3
      M=repmat(max(abs(X(:,i)-repmat(KEY,r,1))),r,1);
      X(:,i)=1-((abs(X(:,i)-repmat(KEY,r,1)))./M);
    elseif k==4
        M=max(a-min(X(:,i)),max(X(:,i))-b);
       for j=1:r 
       if X(j,i)<a
           X(j,i)=1-(a-X(j,i))/M;
       elseif X(j,i)>=a&&X(j,i)<=b
           X(j,i)=1;
       elseif X(j,i)>b
           X(j,i)=1-(X(j,i)-b)/M;
       end
       end
    disp(['第',num2str(c),'个指标正向化完成'])
    end
end
disp('正向化后的矩阵为：')
disp(X);
%% （2）对正向化的矩阵进行预处理
[r,c]=size(X);
D=X./repmat((sum(X,1)/r),r,1);
%% (3)将预处理后的每一行的最大值取出构成母序列
Mother=repmat(max(D),r,1);
a=repmat(min(abs(D-Mother)),r,1);
b=repmat(max(abs(D-Mother)),r,1);
%% (4)计算各个指标的灰色关联度
Y=(a+0.5*b)./(abs(D-Mother)+0.5*b);
Z=(sum(Y)/r);
%% （5）计算各个灰色关联度归一化
Z=(Z./repmat(sum(Z),1,c));
load data_water_quality.mat%将原来的那个X搞回来
disp(['最终',num2str(r),'个指标的评分为：']);
GOAL=sum(D.*repmat(Z,r,1),2)
disp('归一化后的评分')
GOAL2=GOAL./repmat(sum(GOAL,1),r,1)



