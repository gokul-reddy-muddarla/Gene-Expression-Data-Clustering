function [fc,fcc,x,cls] = finalsolution-vote(pf,points,Fn,sz,k)

alpha=0.5;
beta=0.5;

[n,d]=size(points);

fcc=zeros(1,n);

for i=1:sz(1)
   tc=[];
   k=len(pf(i,:))/d;
   tc=chrom_to_cen(pf(i,:),d,k);
   u=member(tc,points);
   tc=updatecenter(tc,points,u);
   fc(i,:)=clustering(u);
   %fc(i,:)=relabel(fc(i,:));
   fc(i,:)=agree(fc(1,:),fc(i,:)); %making each non-dominated solution consistent with the first one.
   tc=findcenter(fc(i,:),n,k,d,points);
   U(:,:,i)=member(tc,points);
   fc(i,:)=clustering(U(:,:,i));
end

if sz(1)==1
    fcc=fc; x=0; cls=0; return
end

%%%%%%%%%%%%%Fuzzy voting%%%%%%%%%%%%%%%%%%%%%
xx=[]; cls=[];
for i=1:n
    i
    for j=1:sz(1)
        [p(j),q(j)]=max(U(:,i,j));
    end
    
    a=find(p >= alpha);
    
    if isempty(a)
        continue
    end
    
    b = q(a);    
    r=unique(b);
    m = length(unique(b));
    
    for j=1:m
        t = r(j);
        a=length(find(b==t));
        if a >= beta*sz(1)
            xx=[xx,i];
            cls = [cls,t];
            break
        end
    end
end
    
x=points(xx,:);
t=cls;
xx_test = setdiff([1:n],xx);
x_test = points(xx_test,:);
t_test = fc(1,xx_test);

dlmwrite('trainpts.txt',[xx',x,t'],'\t');
dlmwrite('testpts.txt',[xx_test',x_test],'\t');



        
    