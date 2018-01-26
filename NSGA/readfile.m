function [points,clus,n,d,k]=readfile(dat)

line=fgets(dat);
line=str2num(line);

n=line(1);
d=line(2);
k=line(3);

for i=1:n
   pts=fgets(dat);
   pt=str2num(pts);
   points(i,:)=pt(1:d);
   clus(i)=pt(d+1);
end

