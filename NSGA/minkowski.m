function mnk=minkowski(cluster,fc,n)

c=ones(n,n); f=ones(n,n);

for i=1:n
   for j=1:n
      if cluster(i)~=cluster(j)
         c(i,j)=0; c(j,i)=0;
      end
      
      if fc(i)~=fc(j)
         f(i,j)=0; f(j,i)=0;
      end
   end
end

Total=0; Total1=0;

for i=1:n
   for j=1:n
      Total = Total + (c(i,j)-f(i,j))*(c(i,j)-f(i,j));
		Total1 = Total1 + c(i,j)*c(i,j);
   end
end

mnk=sqrt(Total/Total1);
         