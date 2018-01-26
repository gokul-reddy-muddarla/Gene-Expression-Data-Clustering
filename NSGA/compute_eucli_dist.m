function sumd=compute_eucli_dist(fc,tc,points,n,d,k)

sumd=0.0; dsum=0.0;
for i=1:k
   for l=1:n
      dsum=0.0;
      if fc(l)==i
         dsum=distnce(tc(i,:),points(l,:),d);
      end
      sumd=sumd+sqrt(dsum);
   end
end

