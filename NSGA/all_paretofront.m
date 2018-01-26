function [F,szF,Ffn,r]=all_paretofront(pop,fv)

[ni,no]=size(fv);
maxlen=size(pop,2);

F=ones(ni,maxlen)*-999;
Ffn=ones(ni,no)*-999;
szF=[];
r=[];

i=1;
while ~isempty(pop)
   
   [pf,pfn,sz,rempop]=paretofront(pop,fv);
   
   lmt=sum(szF);
   
   szF=[szF,sz];

   l=1;
   for j=(lmt+1):(lmt+sz)      
   %for j=1:sz
      F(j,:)=pf(l,:);
      Ffn(j,:)=pfn(l,:);
      r(j)=i;
      l=l+1;
   end
   
   m=1;
   rmnpop=[];
   fvv=[];
   for k=1:size(rempop,1)
      
      if rempop(k,:)~=-999
         
         rmnpop(m,:)=rempop(k,:);
         fvv(m,:)=fv(k,:);
         m=m+1;
         
      end
   end
   
   pop=rmnpop;
   fv=fvv;
   i=i+1;
   
end
   
