function ari=ARI(trueclus,fc);

clus=trueclus;
n=size(clus,2);

a=0; b=0; c=0; d=0;

for i=1:n
   for j=1:n
      if clus(i)==clus(j) & fc(i)==fc(j)
         a=a+1;
      end
      
      if clus(i)==clus(j) & fc(i)~=fc(j)
         b=b+1;
      end
      
      if clus(i)~=clus(j) & fc(i)==fc(j)
         c=c+1;
      end
      
      if clus(i)~=clus(j) & fc(i)~=fc(j)
         d=d+1;
      end
      
   end
end

ari=2*(a*d-b*c)/((a+b)*(b+d)+(a+c)*(c+d));
      
      