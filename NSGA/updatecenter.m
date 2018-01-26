function tc=updatecenter(tc,points,u,weight)

dist=distfcm(tc,points);
mf = u.^weight;
sumc = sum(sum((dist.^2).*mf));
tc=mf*points./((ones(size(points, 2), 1)*sum(mf'))');
