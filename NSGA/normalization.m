function points=normalization(points)

[n,d]=size(points);

X=mean(points,2);

S=std(points,0,2);

a=find(S==0);
S(a)=.0000001;

X=repmat(X,1,d);
S=repmat(S,1,d);

points=points-X;

points=points./S;

