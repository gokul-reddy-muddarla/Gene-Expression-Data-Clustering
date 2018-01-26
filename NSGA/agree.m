function fc = agree(clus,fc)

k = max(fc);
fcc=fc;
for i=1:k
    a = find(fc==i);
    b = clus(a);
    x = unique(b);
    
    maxm=-9;
    for j=1:length(x)
        t = x(j);
        y = length(find(b==t));
        
        if y > maxm
            v = t;
            maxm = y;
        end
    end
    
    fcc(a) = v;
end

fc = fcc;