function [Vector] = NewGx(alpha, Vector, N)



    for i=1:N
      for j=1:N
          Rz = [cos(alpha) -sin(alpha) 0;sin(alpha) cos(alpha) 0; 0 0 1];
          temp = [Vector(i,j,1) ; Vector(i,j,2) ; Vector(i,j,3)];
          temp = Rz * temp;
          Vector(i,j,1) = temp(1,1);
          Vector(i,j,2) = temp(2,1);
          Vector(i,j,3) = temp(3,1);
      end
    end
  

end

        
    
