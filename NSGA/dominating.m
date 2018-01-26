function ans=dominating(fv1,fv2)

ans=-1;
no=size(fv1,2);

diff=fv1(1,:)-fv2(1,:);
s1=size(find(diff>0),2);
s2=size(find(diff<0),2);

if s2==no|(s2>0 & s1==0)
   ans=1;
end

if s1>0 & s2>0
   ans=0;
end
