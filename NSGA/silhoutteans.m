function winner=silhoutteans(points,allclus,k)

delete 'silvalues.txt';
[row,width]=size(allclus);

[x,y]=size(points);
max=-2;
final=0;


dlmwrite('countallclus.txt',row,'\t');

[l,b]=size(allclus);
max=-2;
for i=1:l
    sum=zeros(1,k);
    count=zeros(1,k);
    tmp=allclus(i,:);
     %dlmwrite('silvalues.txt',tmp,'-append');
    answer=0;
    value = silhouette(points,tmp,'Euclidean');
    for j=1:x
        sum(tmp(j))=sum(tmp(j))+value(j);
        count(tmp(j))=count(tmp(j))+ 1;
       %  dlmwrite('silvalues.txt',tmp(j),'-append');
    end
    %dlmwrite('silvalues.txt',count,'-append');
    for j=1:k
        if count>0
        answer = answer + sum(j)/count(j);
        end
    end
    answer=answer/k;
    if answer>max
        max=answer;
        final=i;
    end
    dlmwrite('silvalues.txt',answer,'-append');
    
        
end

 dlmwrite('bestsilvalues.txt',max,'-append');

tmp2=allclus(final,:);

winner=tmp2;
silhouette(points,winner);


