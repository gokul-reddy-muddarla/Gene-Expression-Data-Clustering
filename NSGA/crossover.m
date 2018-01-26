function pop_crossover=crossover(pop_mat,pcross,min_k,max_k,d);

[s,ln]=size(pop_mat);

pop_crossover=[];


while size(pop_crossover,1)<=s
    
    p=round(unifrnd(1,size(pop_mat,1)));
    q=round(unifrnd(1,size(pop_mat,1)));
    
    if rand < pcross
        ch1=[];
        ch2=[];
        
        lp=len(pop_mat(p,:))/d;
        lq=len(pop_mat(q,:))/d;
        
        tcp=chrom_to_cen(pop_mat(p,1:lp*d),d,lp);
        tcq=chrom_to_cen(pop_mat(q,1:lq*d),d,lq);
        
%         if lp==2
%             cpoint1=1*d;
%         else
%             cpoint1=round(unifrnd(2,lp-1))*d;
%         end
%         
%         if lq==2
%             cpoint2=1*d;
%         else
%             cpoint2=round(unifrnd(2,lq-1))*d;
%         end
        
        cpoint1=round(unifrnd(0,lp));
        
        cpoint2_min = min(2, max(0, 2 - (lp - cpoint1)));
        cpoint2_max = lq - max(0, (2 - cpoint1));
        
        if cpoint2_max > cpoint2_min
            cpoint2=round(unifrnd(cpoint2_min,cpoint2_max));
        else
            cpoint2=0;
        end   
        
        ch1cen=[tcp(1:cpoint1,:);tcq(cpoint2+1:end,:)];
        
        ch2cen=[tcq(1:cpoint2,:);tcp(cpoint1+1:end,:)];
        
            
%         ch1(1:d*max_k)=-999;
%         ch2(1:d*max_k)=-999;
%         
%         ch1(1:cpoint1)=pop_mat(p,1:cpoint1);
%         ch1(cpoint1+1:cpoint1+len(pop_mat(q,:))-cpoint2)=pop_mat(q,cpoint2+1:len(pop_mat(q,:)));
%         
%         ch2(1:cpoint2)=pop_mat(p,1:cpoint2);
%         ch1(cpoint2+1:cpoint2+len(pop_mat(p,:))-cpoint1)=pop_mat(p,cpoint1+1:len(pop_mat(p,:)));
        
        %ch1(1:cpoint1+len(pop_mat(q,:))-cpoint2)=[pop_mat(p,1:cpoint1),pop_mat(q,cpoint2+1:len(pop_mat(q,:)))];
        %ch2(1:cpoint2+len(pop_mat(p,:))-cpoint1)=[pop_mat(q,1:cpoint2),pop_mat(p,cpoint1+1:len(pop_mat(p,:)))];
        
        ch1=cen_to_chrom(ch1cen);  
        ch2=cen_to_chrom(ch2cen);  
        
        ch1(length(ch1)+1:ln)=-999;
        ch2(length(ch2)+1:ln)=-999;
        
        if valid(ch1,min_k,max_k,d)
            pop_crossover=[pop_crossover;ch1];
        end
        if valid(ch2,min_k,max_k,d)
            pop_crossover=[pop_crossover;ch2];
        end
    else
      pop_crossover=[pop_crossover;pop_mat(p,:)];
      pop_crossover=[pop_crossover;pop_mat(q,:)];
   end
end

pop_crossover=pop_crossover(1:s,:);

return

[s,ln]=size(pop_mat);

pop_crossover=[];


while size(pop_crossover,1)<=s
   
   
   p=round(unifrnd(1,size(pop_mat,1)));
   q=round(unifrnd(1,size(pop_mat,1)));
   
   if rand < pcross
      
      ch1=pop_mat(p,:);
      ch2=pop_mat(q,:);
      
      mask=round(random('unif',0,1,1,ln));
      for i=1:ln
         if mask(i)==1
            temp=ch1(i);
            ch1(i)=ch2(i);
            ch2(i)=temp;
         end
      end
      pop_crossover=[pop_crossover;ch1];
      pop_crossover=[pop_crossover;ch2];
   else
      pop_crossover=[pop_crossover;pop_mat(p,:)];
      pop_crossover=[pop_crossover;pop_mat(q,:)];
   end
end
pop_crossover=pop_crossover(1:s,:);