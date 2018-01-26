function [fc,x,K]=selectsol(nd,fcc,ndr,fccr)

% fck=max(fcc');
% fcrk=max(fccr');
% 
% for i=1:length(fck)
%     k=fck(i);
%     a=find(fcrk==k);
%     if ~isempty(a)
%         dst(i)=mean(distfcm(nd(i,:),ndr(a,:)));
%     else
%         dst(i)=0;
%     end
% end
% 
% % dist=distfcm(ndr,nd)
% % 
% % [mnd,a]=min(dist)
% % 
% % [mnn,b]=max(mnd)
% % 
% % [m,c]=min(dist(:,b))
% 
% [mn,b]=max(dst);
% x=b;
% fc=fcc(x,:);
% K=max(fc);
% a=find(fcrk==K);
% [ds,c]=max(distfcm(nd(x,:),ndr(a,:)));
% c=a(c);
% 
% plot(nd(:,1),nd(:,2),'.');
% hold
% plot(ndr(:,1),ndr(:,2),'k.');
% plot(nd(x,1),nd(x,2),'o');
% plot(ndr(c,1),ndr(c,2),'ko');

[ndd,a]=sort(nd(:,1));

ang(1)=999;

nd=nd(a,:);

for i=2:size(nd,1)-1
    
    m1=(nd(i,2)-nd(i-1,2))/(nd(i,1)-nd(i-1,1));
    m2=(nd(i,2)-nd(i+1,2))/(nd(i,1)+nd(i-1,1));
    
    ang(i)=(m1-m2)/(1-m1*m2);
    
end

ang(i+1)=999;

[mx,b]=min(ang);
x=a(b);

fc=fcc(x,:);
K=max(fc);

plot(nd(:,1),nd(:,2),'.');
hold
plot(nd(b,1),nd(b,2),'o');
