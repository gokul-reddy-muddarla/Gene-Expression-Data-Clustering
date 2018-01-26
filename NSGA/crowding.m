function rn=crowding(fv)

[ni,no]=size(fv);

dist=zeros(ni,1);

for m=1:no
   
   [a,b]=sort(fv(:,m));
   
   dist(b(1))=9999.99; dist(b(ni))=9999.99;
   
   for i=2:ni-1
   	dist(b(i))=dist(b(i)) + abs(fv(b(i+1),m)-fv(b(i-1),m));
   end
end

[a,r]=sort(dist);
i=1;
for j=ni:-1:1
    rn(r(i),1)=j;
    i=i+1;
end

