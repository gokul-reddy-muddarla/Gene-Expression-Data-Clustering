function plotimage(a);

k=max(max(a));

for i=1:512
   i
   for j=1:512
      if a(i,j)==1
         plot(i,j,'.');
         
      elseif a(i,j)==2
         plot(i,j,'.r');
         
      elseif a(i,j)==3
         plot(i,j,'.k');
         
      elseif a(i,j)==4
         plot(i,j,'.y');
         
      elseif a(i,j)==5
         plot(i,j,'c.');
         
      elseif a(i,j)==6
         plot(i,j,'g.');
         
      else
         plot(i,j,'m.');
         
      end
   end
end
      