function [Vector] = RotationG( Vector , N)

for i=1:N
    for j=1:N
        
         alpha2 = ((pi*4)*i)/(N);
         Rz = [cos(alpha2) -sin(alpha2) 0;sin(alpha2) cos(alpha2) 0; 0 0 1];
         temp = [Vector(i,j,1) ; Vector(i,j,2) ; Vector(i,j,3)];
         temp = Rz * temp;
         Vector(i,j,1) = temp(1,1);
         Vector(i,j,2) = temp(2,1);
         Vector(i,j,3) = temp(3,1);
    end
end

end
