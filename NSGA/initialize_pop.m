function init_pop=initialize_pop(points,min_k,max_k,pop_size)

[n,d]=size(points);

maxpts=max(points);
minpts=min(points);
init_pop=ones(pop_size,d*max_k)*-999;
%init_pop=unifrnd(min(minpts),max(maxpts),pop_size,k*d);

for i=1:pop_size
   if min_k==max_k
      kk=min_k;
   else
      kk=round(unifrnd(min_k,max_k));
   end
   tc=[];
   for j=1:kk
      r=round(unifrnd(1,n));
      tc(j,:)=points(r,:)+2*rand;
   end
   init_pop(i,1:d*kk)=cen_to_chrom(tc);
end