clear;clc;
cd 'C:\Users\lenovo\Desktop\Ӧ��һ��������ҵ��GDP��Ӱ��̶�'
load gdp.mat
[r,c]=size(gdp);% �ȰѾ���Ĵ�Сsize��������
A=gdp./(sum(gdp,1)/r);%�����ȶԱ�������Ԥ������ÿ�����ݳ��Ը��еľ�ֵ
B=abs(A(1:end,2:end)-repmat(A(:,1),1,c-1));%���abs��x0-x1��
a=repmat(min(B(:)),r,c-1);
b=repmat(max(B(:)),r,c-1);% �ҳ�ϵ��a��b
rho=0.5;%����ֱ�ϵ����һ��ȡֵΪ0.5
P=((repmat(rho,r,c-1)).*b+a)./(B+(repmat(rho,r,c-1)).*b);

disp('���ڼ��������ҵ�Ļ�ɫ�����ȣ�');
disp('��һ��ҵ�뾭��GDP�Ļ�ɫ������Ϊ��')
X=mean(P(:,1))% �Ծ���������ƽ��ֵ
disp('�ڶ���ҵ�뾭��GDP�Ļ�ɫ������Ϊ��')
Y=mean(P(:,2))
disp('������ҵ�뾭��GDP�Ļ�ɫ������Ϊ��')
Z=mean(P(:,3))

if X>Y
   if X>Z
       disp('X�Ļ�ɫ��������ߣ���һ��ҵ��GDPӰ�����')
   elseif X<Z
       disp('Z�Ļ�ɫ��������ߣ�������ҵ��GDPӰ�����')
   end
elseif X<Y
    if Y>Z
       disp('Y�Ļ�ɫ��������ߣ��ڶ���ҵ��GDPӰ�����')
   elseif Y<Z
       disp('Z�Ļ�ɫ��������ߣ�������ҵ��GDPӰ�����')
   end
end

    
