function v=valid(chrom,min_k,max_k,d)

L=len(chrom);
if L>max_k*d | L<min_k*d | mod(L,d)~=0 
   v=0;
else
   v=1;
end

