当年的word 排版  然后 附上代码
1枚举法A
A =[2 15 13 4;10 4 14 15 ;9 14 16 13 ;7 8 11 9];
B = zeros(4,4);   
F=zeros(4,4); %满足要求的分配方案
x=[];y=[];w=0;e=0;
for i=1:4
    B(1,:)=0; B(1,i)=1;
    for j=1:4
        B(2,:)=0;
        if(j~=i) B(2,j)=1;end
        for k=1:4
            B(3,:)=0;
            if(k~=i && k~=j) B(3,k)=1;end
    for m=1:4
      B(4,:)=0;
    if(m~=i && m~=j && m~=k)B(4,m)=1;end    
                sum=0;
                for aa=1:4
              for bb = 1:4
         sum = sum+B(aa,bb);
                  end
                end
                num=0;
                if(sum==4)
                   F = B;
                   y = [y,F];
                   for aa=1:4
         for bb = 1:4
    num = num+F(aa,bb)*A(aa,bb);
                   end
                    end
                    w=w+1;
                    x(w)=num;
                end
            end
        end
    end           
    end
[k,g]=min(x)
M=[y(1,4*g+1:4*g+4);y(2,4*g+1:4*g+4);y(3,4*g+1:4*g+4);y(4,4*g+1:4*g+4)]
2枚举法B
A=[15 18 21 24;19 23 22 18;26 17 16 19;19 21 23 17];
D=zeros(4,4);
E=zeros(24,4);
p=1;
l=1;
for i=1:4
    a=A(1,i);
    for j=1:4
        if i~=j
            b=A(2,j);
        end
        for h=1:4
            if h~=i&&h~=j
                c=A(3,h);
            end
            for k=1:4
                if k~=i&&k~=j&&k~=h
                d=A(4,k);
                end
        if  i~=j &&j~=h&&h~=k&&i~=h&&j~=k&&i~=k
                s(p)=a+b+c+d;
                  p=p+1;
                 E(l,:)=[i j h k];
                 l=l+1;
                end
            end
        end
    end
end
[t,v]=min(s)
n=E(v,:);
D(1,E(v,1))=1;
D(2,E(v,2))=1;
D(3,E(v,3))=1;
D(4,E(v,4))=1;
D
3匈牙利法
A=[2 15 13 4;10 4 14 15;9 14 16 13;7 8 11 9]；E=A；
for i=1:4=min(A(i,:));
end
A(1,:)=A(1,:)-m(1,1);
A(2,:)=A(2,:)-m(1,2);
A(3,:)=A(3,:)-m(1,3);
A(4,:)=A(4,:)-m(1,4);
k=min(A)
A(:,1)=A(:,1)-k(1,1);
A(:,2)=A(:,2)-k(1,2);
A(:,3)=A(:,3)-k(1,3);
A(:,4)=A(:,4)-k(1,4)
A1=find(A(1,:)==0);
A2=find(A(2,:)==0);
A3=find(A(3,:)==0);
A4=find(A(4,:)==0);
for i=1:length(A1)
   for j=1:length(A2)
    for k=1:length( A3)
     for l=1:length(A4)
      B=[A1(i) A2(j) A3(k) A4(l)];
      C=unique(B);
      if  size(C)==[1 4]
          B
     end
    end 
   end
   end
end
f=E(1,B(1))+E(2,B(2))+E(3,B(3))+E(4,B(4))
4精简版
A=[2 15 13 4;10 4 14 15;9 14 16 13;7 8 11 9];
ans=inf;
for i=1:4
   for j=1:4
     for k=1:4
       for l=1:4
if length(unique([i j k l]))==4
  if A(1,i)+A(2,j)+A(3,k)+A(4,l)<ans
    ans=A(1,i)+A(2,j)+A(3,k)+A(4,l);
       index=[i j k l]
       end
      end
     end
   end
  end
end
ans
index

来自网络版
c=[ 2 15 13 4 100;10 4 14 15 100;9 14 16 13 100;7 8 11 9 100;100 100 100 100 100]; 
c=c(:);   a=zeros(10,25); 
for i=1:5 
a(i,(i-1)*5+1:5*i)=1;   a(5+i,i:5:25)=1; 
end 
b=ones(10,1);   [x,y]=bintprog(c,[],[],a,b); 
x=reshape(x,[5,5]),d=y-100
这些 都是 讨论然后  优化了，感觉就是 其中FOR循环用得6起，最后附录一图
