function [pf,pfn,sz,rempop]=paretofront(pop,fv)

ni=size(fv,1);

pf=[];
pfn=[];
sz=0;
rempop=pop;

for i=1:ni
   cnt=0;
   for j=1:ni
      if i~=j
         ans=dominating(fv(j,:),fv(i,:));
        	if ans==1
            break
         else
         	cnt=cnt+1;
         end
   	end
   end
   
   if cnt==ni-1
      pf=[pf;pop(i,:)];
      pfn=[pfn;fv(i,:)];
      rempop(i,:)=-999;
   	sz=sz+1;
   end
end