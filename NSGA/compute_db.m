function dbi=compute_db(fc,tc,points)

[n,d]=size(points);
k=max(fc);

for i=1:k
   nk(i)=size(find(fc==i),2);
end

for t=1:k
   sumd(t)=0.0;
   if nk(t)>0
      for l=1:n
         dsum=0.0;
         if fc(l)==t
            sumd(t)=sumd(t)+sqrt(distnce(tc(t,:),points(l,:),d));
         end
      end
      disp(t)=sumd(t)/nk(t);
   else 
      disp(t)=0.0;
   end
end

rmax=zeros(1,k);
r=zeros(k,k);

for i=1:k
   if nk(i)>0
      j=rem(i,k)+1;
      while j~=i
         if(nk(j)>0) 
            dd=sqrt(distnce(tc(i,:),tc(j,:),d));
            
            r(i,j)=(disp(i)+disp(j))/dd;
         else 
            r(i,j)=0.0;
         end
         j=rem(j,k)+1;
      end
   end
end

rmax=max(r,[],2);
rmax=rmax';

dbi=sum(rmax);
dbi=k/dbi; 
dbi=1.0/dbi;
