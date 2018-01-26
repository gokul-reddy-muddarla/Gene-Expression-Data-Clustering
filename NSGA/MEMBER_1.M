function u=member(tc,points,n,k,d)

for Index1=1:n
   for Index2=1:k
      Di1i2(Index2)=sqrt(distnce(points(Index1,:),tc(Index2,:),d));
   end   
   
   for Index2=1:k
      Flag=1;
      if Di1i2(Index2)==0 
         u(Index2,Index1)=1.0;
      else
         Sumc=0;
         for Index3=1:k
            Di1i3=Di1i2(Index3);
            if Di1i3==0
               Flag=0;
               break;
            else
               Sumc=Sumc+(Di1i2(Index2)/Di1i3)^(2.0/(2 - 1));
            end
         end
         if Flag~=1
            u(Index2,Index1)=0;
         elseif Sumc > 0
            u(Index2,Index1)=1.0/Sumc;
         end
      end
   end
end
