function u=member(tc,points,weight)

k=size(tc,1);
dist=distfcm(tc,points);
tmp=dist.^(-weight/(weight-1));
%tmp=dist.^(-2/(weight-1));
u=tmp./(ones(k,1)*sum(tmp));
