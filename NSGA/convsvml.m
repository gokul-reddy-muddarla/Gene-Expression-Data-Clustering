function convsvml(points,clus,fname)

f=fopen(fname,'w');

[n,d]=size(points);

for i=1:n
    fprintf(f,'%d ',clus(i));
    for j=1:d
        s=[num2str(j),':'];
        fprintf(f,'%s',s);
        fprintf(f,'%f ',points(i,j));
    end
    
    fprintf(f,'\n');
end

fclose(f);