function tc=findcenter(lv,n,k,d,points)

sumc=zeros(k,d); c1=zeros(1,k);   
for i=1:n
   
   for j=1:k
      if lv(i)==j
         sumc(j,:)=sumc(j,:)+points(i,:);
         c1(j)=c1(j)+1;
      end
   end
end

tc=zeros(k,d);
for j=1:k
   if c1(j)~=0
      tc(j,:)=sumc(j,:)/c1(j);
   end
end
