function tc=chrom_to_cen(chrom,d,k);

tc=[];
dd=1;
for i=1:k
   tc=[tc;chrom(dd:dd+d-1)];
   dd=dd+d;
end
   