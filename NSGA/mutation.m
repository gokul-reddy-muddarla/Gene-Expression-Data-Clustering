function pop_mut=mutation(pop_crossover,pmut,d)

[s,max_k]=size(pop_crossover);

for i=1:s
    %tc=chrom_to_cen(pop_crossover(i,:),d,k);
    if pmut < rand
        p=round(unifrnd(1,len(pop_crossover(i,:))/d));
        %tc(p,:)=tc(p,:)+0.05;
        for j=1:d
            if pop_crossover(i,p*j)~=0
                pop_crossover(i,p*j)=pop_crossover(i,p*j)+2*unifrnd(-1,1)*pop_crossover(i,p);   
            else
                pop_crossover(i,p*j)=pop_crossover(i,p*j)+2*unifrnd(-1,1);   
            end
        end
    end
end

pop_mut=pop_crossover;


