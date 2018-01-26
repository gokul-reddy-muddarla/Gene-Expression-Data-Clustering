function [pop,fv]=ranking(pop,fv)

rn=[];
[F,szF,Ffn,r]=all_paretofront(pop,fv);

for i=1:size(szF,2)
   
   if i==1
      lmt=1;
   else
      lmt=sum(szF(1:i-1))+1;
   end
   
   rnn=crowding(Ffn(lmt:lmt+szF(i)-1,:));
   rn=[rn,rnn'];
   
   for j=lmt:lmt+szF(i)-1
      rnk(j)=rn(j)+lmt-1;
   end
end


for j=1:size(rnk,2)
   pop(rnk(j),:)=F(j,:);
   fv(rnk(j),:)=Ffn(j,:);
end