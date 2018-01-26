function dunn=compute_dunni(fc,tc,points)

[n,d]=size(points);
k=max(fc);

for i=1:k
   nk(i)=size(find(fc==i),2);
end

sum_d=[];
for i=1:k
   sumd=0.0; t=1;
   for j=1:n
      if fc(j)==i
         dd=sqrt(distnce(points(j,:),tc(i,:),d));
         t=t+1;
         sumd=sumd+dd;
      end
   end
   sum_d(i)=2.0*sumd/t;  %capital DELTA_3 
end
max_d=max(sum_d);

%sum_d=[]; l=1; 
%for i=1:k-1
 %  for j=i+1:k
  %    pi=find(fc==i);
   %   pj=find(fc==j);
    %  sumd=0.0;

%      for a=1:nk(i)
 %        for b=1:nk(j)
  %          sumd=sumd + distnce(points(pi(a),:),points(pj(b),:),d);
   %      end
    %  end
      
     % sum_d(l)=sumd/(nk(i)*nk(j));  %small delta_3 
      %l=l+1;
      
  % end
%end
%min_d=min(sum_d);   

sum_d=[];
dist=distfcm(tc,tc);
l=1;

for i=1:k-1
   for j=i+1:k
      if nk(i)>0 & nk(j)>0
         sum_d(l)=dist(i,j);%/nk(i)*nk(j);
         l=l+1;
      end
   end
end
min_d=min(sum_d);

d1=min_d;
d2=1/max_d;
dunn=min_d/max_d;
dunn=1.0/dunn;
         