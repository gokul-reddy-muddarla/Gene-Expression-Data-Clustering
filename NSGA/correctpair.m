function cp=correctpair(clus,fc);

n=size(clus,2);
confusion=zeros(2,2); total=0;
for i=1:n
    for j=i+1:n
        total=total+1;
        if clus(i)==clus(j) & fc(i)==fc(j)
            confusion(1,1)=confusion(1,1)+1;
        elseif clus(i)~=clus(j) & fc(i)~=fc(j)
            confusion(2,2)=confusion(2,2)+1;
        end
    end
end

cp=((confusion(1,1)+confusion(2,2))*100)/total;