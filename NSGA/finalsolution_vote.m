function [fc,fcc,x,cls] = finalsolution_vote(pf,points,Fn,sz,k,alpha,beta,weight)

%alpha=0.5;
%beta=0.5;

[n,d]=size(points);

fcc=zeros(1,n);
delete 'cluscentre.txt';

for i=1:sz(1)
   tc=[];
   k=len(pf(i,:))/d;
   tc=chrom_to_cen(pf(i,:),d,k);
   u=member(tc,points,weight);
   tc=updatecenter(tc,points,u,weight);
   fc(i,:)=clustering(u);
end

for i=1:sz(1)
   tc=[];
   k=len(pf(i,:))/d;
   tc=chrom_to_cen(pf(i,:),d,k);
   u=member(tc,points,weight);
   tc=updatecenter(tc,points,u,weight);
   fc(i,:)=clustering(u);
   %fc(i,:)=relabel(fc(i,:));
   fc(i,:)=agree(fc(1,:),fc(i,:)); %making each non-dominated solution consistent with the first one.
   tc=findcenter(fc(i,:),n,k,d,points);
   
   dlmwrite('cluscentre.txt',tc,'-append');
  
   U(:,:,i)=member(tc,points,weight);
   fc(i,:)=clustering(U(:,:,i));
end

if sz(1)==1
    fcc=fc; x=0; cls=0; return
end
fcc=fc;
%%%%%%%%%%%%%Fuzzy voting%%%%%%%%%%%%%%%%%%%%%
xx=[]; cls=[];
for i=1:n
    i;
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

if length(t)==n
    fc=t;
    return
end
dlmwrite('trainpts.txt',[xx',x,t'],'\t');
dlmwrite('testpts.txt',[xx_test',x_test],'\t');

convsvml(x,t','trainsvm.txt');
convsvml(x_test,xx_test','testsvm.txt');

system('svm_multiclass_learn -c 100 -t2 -g0.9 trainsvm.txt modelsvm.txt');
system('svm_multiclass_classify testsvm.txt modelsvm.txt outsvm.txt');

load outsvm.txt;

fct=outsvm(:,1);

fc=zeros(1,n);
fc(xx)=t;
fc(xx_test)=fct;



        
    