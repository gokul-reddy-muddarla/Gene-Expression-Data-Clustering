function pts=writecluster(points,fc,f_name)

[n,d]=size(points);
k=max(fc);

pts=points;
fd=fopen(f_name,'w');

fprintf(fd,'%d %d %d\n',n,d,k);
for i=1:n
   fprintf(fd,'%f ',points(i,:));
   fprintf(fd,'%d\n',fc(i));
   %pts(i,d+1)=fc(i);
end

fclose(fd);