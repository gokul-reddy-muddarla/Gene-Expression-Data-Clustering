function [fc,fcc,nd,sil]=nsga2(points,min_k,max_k)

% USE: [clus,nond]=moga(points,minK,maxK) 
% 
% Inputs: 'points' is an n X d matrix of n data points and d dimensions.
%         'minK' and 'maxK' are the minimum and maximum number of clusters, respectively.
%
% Outputs: 'clus' is a p X n matrix denoting the class labels of n points 
%          for p non-dominated solutions.
%          'nond' is the final non-dminated pareto front.
%
% The multiobjective clustering uses Jm and XB as the two objective
% functions.
%
% By default the algorithm uses Euclidean distance. To use correlation
% based distance, just rename the file 'distfcm1.m' in this folder to
% 'distfcm.m'. To use the Euclidean distance again, restore the name of the file to 'distfcm1.m'. 


warning off MATLAB:divideByZero
[no_gen,pop_size,pcross,pmut,no,selc]=readinput;

% min_k = K;
% max_k = K;

[n,d]=size(points);

init_pop=initialize_pop(points,min_k,max_k,pop_size);
[fit_old,pop_old]=findfitness(points,init_pop,n,d,no,selc);

for i=1:no_gen
   i
   pop_new=[];
   [pop_old,fit_old]=ranking(pop_old,fit_old);
   pop_mat=fill_mat(pop_old);
   pop_crossover=crossover(pop_mat,pcross,min_k,max_k,d);
   pop_mut=mutation(pop_crossover,pmut,d);
   [fit_mut,pop_mut]=findfitness(points,pop_mut,n,d,no,selc);
   
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
%nd=fit_new;

%[fcc,fc,x,cls] = finalsolution(pf,points,Fn,sz,K);

[fc,fcc,x,cls,sil] = finalsolution(pf,points,Fn,sz);

dlmwrite('bestclustering.txt',fc,' ');
dlmwrite('allclustering.txt',fcc,' ');
dlmwrite('pareto.txt',nd,' ');
dlmwrite('Silhouette.txt',sil,' ');

      
   

   

   
   
   
   


   
