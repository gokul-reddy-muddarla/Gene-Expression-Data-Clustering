
for i=1:n
   if fc(1,i)==1
      	plot(points(i,1),points(i,2),'r*');
   elseif fc(1,i)==2
         plot(points(i,1),points(i,2),'go');
   elseif fc(1,i)==3
         plot(points(i,1),points(i,2),'b+');
   elseif fc(1,i)==4
         plot(points(i,1),points(i,2),'mx');
   elseif fc(1,i)==5
      	plot(points(i,1),points(i,2),'k^');
   elseif fc(1,i)==6
         plot(points(i,1),points(i,2),'kh');
   elseif fc(1,i)==7
         plot(points(i,1),points(i,2),'bp');
   elseif fc(1,i)==8
         plot(points(i,1),points(i,2),'ms');
   elseif fc(1,i)==9
         plot(points(i,1),points(i,2),'gd');
   
   end
   hold on
end
 

hold off
