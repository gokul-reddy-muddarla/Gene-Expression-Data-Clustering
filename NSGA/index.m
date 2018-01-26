function [jm,xb,kindex]=index(points,tc,u,weight,K)

dist=distfcm(tc,points);
mf = u.^weight;
sumc = sum(sum((dist.^2).*mf));
jm=sumc;


disttc=distfcm(tc,tc).^2;
for i=1:size(tc,1)
disttc(i,i)=99999;
end
mnm=min(min(disttc));
sumcorr=sum(sum(disttc))-(K*99999);


%den=size(points,1)*mnm;

num = sumc + ((1/K)*sumcorr);
den=mnm+(1/K); %modified
%xb=sumc/den;
xb=num/den;
% xb=1/mnm;  

kk = mean(distfcm(tc,mean(points)).^2);
kindex = (sumc+kk)/den;


