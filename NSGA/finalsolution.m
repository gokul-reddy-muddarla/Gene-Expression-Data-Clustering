function [fc,fcc,x,cls,sil] = finalsolution(pf,points,Fn,sz)

[n,d]=size(points);

fcc=zeros(1,n);

for i=1:sz(1)
   tc=[];
   k=len(pf(i,:))/d;
   tc=chrom_to_cen(pf(i,:),d,k);
   u=member(tc,points);
   tc=updatecenter(tc,points,u);
   fc(i,:)=clustering(u);
   %fc(i,:)=relabel(fc(i,:));
   %sil(i)=1/compute_dbi(fc(i,:),tc,points);
   %sil(i)=compute_pbm(fc,n,d,k,tc,u,points);
   sil(i)=mean(silhouette(points,fc(i,:)));
   [jm(i),xb(i)] = index(points,tc,u);
end

if sz(1)==1
    fcc=fc; x=0; cls=0; return
end
fcc = fc;

[silh,ii] = max(sil);
[xbi,jj] = min(xb);

fc=fcc(ii,:);


cls=silh;

x=points;

        
    