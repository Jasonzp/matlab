%% ���л�ɫ����������������������
clear;clc;
load data_water_quality.mat
[r,c]=size(X);
%% (1)���ȶ�ָ���������
disp(['������',num2str(c),'��ָ��']);
  KEY=input('�м���ָ�����Ϊ��');
  a=input('������ָ���������Ϊ��');
  b=input('������ָ���������Ϊ��');
for i=1:c
    k=input(['��',num2str(i),'��ָ���������','1-������ָ�꣬2-��С��ָ�꣬3-�м���ָ�꣬������ָ��']);
    if k==1
        disp('�������򻯣��Ѿ��Ǽ�����ָ��');
    elseif k==2
        disp(['��',num2str(i),'��ָ���Ǽ�С��'])
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
    disp(['��',num2str(c),'��ָ���������'])
    end
end
disp('���򻯺�ľ���Ϊ��')
disp(X);
%% ��2�������򻯵ľ������Ԥ����
[r,c]=size(X);
D=X./repmat((sum(X,1)/r),r,1);
%% (3)��Ԥ������ÿһ�е����ֵȡ������ĸ����
Mother=repmat(max(D),r,1);
a=repmat(min(abs(D-Mother)),r,1);
b=repmat(max(abs(D-Mother)),r,1);
%% (4)�������ָ��Ļ�ɫ������
Y=(a+0.5*b)./(abs(D-Mother)+0.5*b);
Z=(sum(Y)/r);
%% ��5�����������ɫ�����ȹ�һ��
Z=(Z./repmat(sum(Z),1,c));
load data_water_quality.mat%��ԭ�����Ǹ�X�����
disp(['����',num2str(r),'��ָ�������Ϊ��']);
GOAL=sum(D.*repmat(Z,r,1),2)
disp('��һ���������')
GOAL2=GOAL./repmat(sum(GOAL,1),r,1)



