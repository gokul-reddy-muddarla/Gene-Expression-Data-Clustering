function bb=relabel(aa)

n=length(aa);
k=max(aa);

bb(1:n)=-1;

f(1)=aa(1); 
bb(1)=1;
c=1;
j=0;
[x y]=size(find(bb<0)); 

while y~=0
   j=j+1;   
   for i=1:n
      if aa(i)==f(j)
         bb(i)=c;
      end
   end
   c=c+1;
   
   for i=1:n
      [w v]=size(find(f==aa(i)));
      if v==0
         p=i;
         break
      end
   end
   f=[f,aa(p)];
   [x y]=size(find(bb<0)); 
end