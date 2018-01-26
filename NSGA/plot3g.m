
for i=1:n
    if fc(1,i)==1
        plot3(points(i,1),points(i,2),points(i,3),'r*');
    elseif fc(1,i)==2
        plot3(points(i,1),points(i,2),points(i,3),'go');
    elseif fc(1,i)==3
        plot3(points(i,1),points(i,2),points(i,3),'b+');
    elseif fc(1,i)==4
        plot3(points(i,1),points(i,2),points(i,3),'mx');
    elseif fc(1,i)==5
        plot3(points(i,1),points(i,2),points(i,3),'c^');
    elseif fc(1,i)==6
        plot3(points(i,1),points(i,2),points(i,3),'kh');
    elseif fc(1,i)==7
        plot3(points(i,1),points(i,2),points(i,3),'bp');
    elseif fc(1,i)==8
        plot3(points(i,1),points(i,2),points(i,3),'ms');
    elseif fc(1,i)==9
        plot3(points(i,1),points(i,2),points(i,3),'gd');
        
    end
    hold on
end
 

hold off
