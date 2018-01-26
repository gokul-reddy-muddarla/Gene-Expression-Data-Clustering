function [fit,pop]=findfitness(points,pop,n,d,no,selc,weight,K)

for i=1:size(pop,1)
    L=len(pop(i,:));
    tc=chrom_to_cen(pop(i,1:L),d,L/d);
    u=member(tc,points,weight);
    tc=updatecenter(tc,points,u,weight);
    %u=member(tc,points);
    %fc=clustering(u);
    [a,fc]=max(u);
    k=max(fc);
     %dbi=compute_dbi(fc,tc,points);
%     dunn=compute_dunni(fc,tc,points);
    %[fit(i,1),fit(i,2)]=compute_I(fc,n,d,k,tc,points);
    [jm,xb]=index(points,tc,u,weight,K);
    
    %pbm=compute_pbm(fc,n,d,L/d,tc,u,points);
    %fit(i,1)=sum(silhouette(points,fc))/size(points,1);
    %fit(i,2)=dunn;
    
    if no==1
        if selc==1
            fit(i,1)=jm;
        else
            fit(i,1)=xb;
        end  
    else
        fit(i,1)=jm;
        fit(i,2)=xb;
        %fit(i,3)=1/pbm;
    end
    chrom=cen_to_chrom(tc);   
    pop(i,1:L)=chrom;
end
