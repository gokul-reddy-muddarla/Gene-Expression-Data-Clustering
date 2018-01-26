function [pbm]=compute_I(fc,n,d,k,tc,points)

ed=compute_eucli_dist(fc,tc,points,n,d,k);

inter=0.0;


disttc=distfcm(tc,tc);
inter=max(max(disttc));
%inter=min(min(find(disttc~=0)));

len=k;
k = 1;
fc(1:n)=1;
%initialise_clusters();
tc=findcenter(fc,n,k,d,points);
%compute_cls_centre(0);
ed1 = compute_eucli_dist(fc,tc,points,n,d,k);
%pbm1=1/(ed1*ed1*inter*inter);
%pbm2=1/(len*len*ed*ed);
pbm=(ed1*ed1*inter*inter)/(len*len*ed*ed);
%pbm=(ed1*ed1*minm*minm)/(len*len*ed*ed);
%pbm1=(ed/ed1)^2;
%pbm2=(len/inter)^2;

