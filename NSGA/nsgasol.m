%function [allclus,clus,nond]=nsgasol
function [allclus,winner]=nsgasol

% USE: [clus,allclus,nond]=mogasvm(points,K) 
% 
% Inputs: 'points' is an n X d matrix of n data points and d dimensions.
%         'K' is the number of clusters.
%
% Outputs: 'clus' is a vector of length n denoting the final class labels obtained by fuzzy voting and SVM  
%          'allclus' is a p X n matrix denoting the class labels of n points for p non-dominated solutions.
%          'nond' is the final non-dminated pareto front.
% 
% The multiobjective clustering uses Jm and XB as the two objective
% functions.
%
% By default the algorithm uses Euclidean distance. To use correlation
% based distance, just rename the file 'distfcm1.m' in this folder to
% 'distfcm.m'. To use the Euclidean distance again, restore the name of the file to 'distfcm1.m'. 

fileid=fopen('sporulation.txt','r');
[points,clus,n,d,K]=readfile(fileid);

[no_gen,pop_size,pcross,pmut,no,selc,weight,alpha,beta]=readinput;

min_k = K;
max_k = K;

[n,d]=size(points);
idx = kmeans(points,K);
 dlmwrite('kmeansans.txt',idx,'-append');
 sum1=zeros(1,K);
    count1=zeros(1,K);
    tmp1=idx;
     %dlmwrite('silvalues.txt',tmp,'-append');
    answer1=0;
    value1 = silhouette(points,tmp1,'Euclidean');
    for j=1:n
        sum1(tmp1(j))=sum1(tmp1(j))+value1(j);
        count1(tmp1(j))=count1(tmp1(j))+ 1;
       %  dlmwrite('silvalues.txt',tmp(j),'-append');
    end
    %dlmwrite('silvalues.txt',count,'-append');
    for j=1:K
        if count1>0
        answer1 = answer1 + sum1(j)/count1(j);
        end
    end
    answer1=answer1/K;
dlmwrite('kmeansilval.txt',answer1,'-append');
init_pop=initialize_pop(points,min_k,max_k,pop_size);
[fit_old,pop_old]=findfitness(points,init_pop,n,d,no,selc,weight,K); %added number of clusters

for i=1:no_gen
   i
   pop_new=[];
   [pop_old,fit_old]=ranking(pop_old,fit_old);
   pop_mat=fill_mat(pop_old);
   pop_crossover=crossover(pop_mat,pcross,min_k,max_k,d);
   pop_mut=mutation(pop_crossover,pmut,d);
   [fit_mut,pop_mut]=findfitness(points,pop_mut,n,d,no,selc,weight,K);
   
   pop_tmp=[pop_old;pop_mut];
   fit_tmp=[fit_old;fit_mut];
   
   [pop_tmp,fit_tmp]=ranking(pop_tmp,fit_tmp);
   
   pop_new=pop_tmp(1:pop_size,:);
   fit_new=fit_tmp(1:pop_size,:);
  
   pop_old=pop_new;
   fit_old=fit_new;
end   

[pf,sz,Fn,r]=all_paretofront(pop_new,fit_new);

nd=Fn(1:sz(1),:);

dlmwrite('clustercenter.txt',size(pf),'\t');
%nd=fit_new;

%[fcc,fc,x,cls] = finalsolution(pf,points,Fn,sz,K);

%[fc,fcc,x,cls,sil] = finalsolution(pf,points,Fn,sz);
[fc,fcc,x,cls] = finalsolution_vote(pf,points,Fn,sz,K,alpha,beta,weight);


clus=fc;
nond=nd;
allclus=fcc;
winner = silhoutteans(points,allclus,K);

dlmwrite('finalclustering.txt',fc,'\t');
dlmwrite('allclustering.txt',fcc,'\t');
dlmwrite('pareto.txt',nd,'\t');

[row,width]= size(nd);
for i=1:row
    v(i)=nd(i,1);
end
for i=1:row
    w(i)=nd(i,2);
end
figure
plot(w,v,'*');
title('Pareto Optimal Front');
xlabel('Objective 1');
ylabel('Objective 2');

currpos=zeros(K);
delete 'cluster1.txt';
delete 'cluster2.txt';
delete 'cluster3.txt';
delete 'cluster4.txt';
delete 'cluster5.txt';
c1=1;
c2=1;
c3=1;
c4=1;
c5=1;
c6=1;

for i=1:n
    
    if clus(i)==1
       
       dlmwrite('cluster1.txt',points(i,:),'-append');
       [s,w]=size(points(i,:));
       for l=1:w
       arr1(c1,l)=points(i,l);
       end
       c1=c1+1;
    end
    if clus(i)==2
        dlmwrite('cluster2.txt',points(i,:),'-append');
        [s,w]=size(points(i,:));
       for l=1:w
       arr2(c2,l)=points(i,l);
       end
       c2=c2+1;
    end
    if clus(i)==3
        dlmwrite('cluster3.txt',points(i,:),'-append');
        [s,w]=size(points(i,:));
       for l=1:w
       arr3(c3,l)=points(i,l);
       end
       c3=c3+1;
    end
    if clus(i)==4
        dlmwrite('cluster4.txt',points(i,:),'-append');
        [s,w]=size(points(i,:));
       for l=1:w
       arr4(c4,l)=points(i,l);
       end
       c4=c4+1;
    end
    if clus(i)==5
        dlmwrite('cluster5.txt',points(i,:),'-append');
        for l=1:w
       arr5(c5,l)=points(i,l);
       end
       c5=c5+1;
      
        
    end
%     if clus(i)==6
%         dlmwrite('cluster6.txt',points(i,:),'-append');
%         for l=1:w
%        arr6(c6,l)=points(i,l);
%        end
%        c6=c6+1;
%     end
end
arr=[1,2,3,4,5,6,7,8,9];

dlmwrite('clustera.txt',arr1,'-append');
    %fid2=fopen('cluster1.txt','r');
    %for i=1:c1
      %  arr(i)=fgets(fid2);
   % end
    
%cgo = clustergram(arr(1:3,:),'Standardize','Row');
%set(cgo,'RowLabels',genes(1:30),'ColumnLabels',times);
clustergram(arr1);
clustergram(arr2);
clustergram(arr3);
clustergram(arr4);
clustergram(arr5);
%clustergram(arr6);

  
 

   
   
   
   


   
