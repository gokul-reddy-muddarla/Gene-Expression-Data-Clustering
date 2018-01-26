function pop_mat=fill_mat(pop_old)

pop_mat=[];

%[a,b]=min(fit);

%pop_mat=[pop_mat;pop_old(b,:)]; %Elitism

while size(pop_mat,1)~=size(pop_old,1)
   p=round(unifrnd(1,size(pop_old,1)));
   q=round(unifrnd(1,size(pop_old,1)));
   %r=round(unifrnd(1,size(pop_old,1)));

   %[x,y]=min(p,q,r);
   if p<q
      pop_mat=[pop_mat;pop_old(p,:)];
   elseif q<p
      pop_mat=[pop_mat;pop_old(q,:)];
   end
   
%   if y==1
 %  	pop_mat=[pop_mat;pop_old(p,:)];
	%elseif y==2
    %  pop_mat=[pop_mat;pop_old(q,:)];
   %else
    %  pop_mat=[pop_mat;pop_old(r,:)];
   %end
   
end