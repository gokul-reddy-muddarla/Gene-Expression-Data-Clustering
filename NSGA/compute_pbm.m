function pbm=compute_pbm(fc,n,d,k,tc,u,points)

%ed=compute_eucli_dist(fc,tc,points,n,d,k);

dist = distfcm(tc,points);

mf = u.^1;
ed = sum(sum((dist.^1).*mf));


inter=0.0;

disttc = distfcm(tc,tc);

inter=max(max(disttc));

len=k;
k = 1;
fc(1:n)=1;
%initialise_clusters();
tc=mean(points);
%tc=findcenter(fc,n,k,d,points);
%compute_cls_centre(0);

dist = distfcm(tc,points);

%tmp=dist.^(-2/(2-1));      
%u=tmp./(ones(k,1)*sum(tmp));
%u=ones(1,n);
%mf = u.^2;
%ed1 = sum(sum((dist.^2).*mf));
ed1=sum(dist);

%ed1 = compute_eucli_dist(fc,tc,points,n,d,k);
pbm=(ed1*ed1*inter*inter)/(len*len*ed*ed);
%pbm=(ed1*ed1*minm*minm)/(len*len*ed*ed);
