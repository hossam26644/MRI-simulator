function [Vector] = Rotation(alpha, Vector , N,direction)

for i=1:N
    for j=1:N
        
        if (direction == 'y')
         Ry = [cos(alpha) 0 sin(alpha);0 1 0;-sin(alpha) 0 cos(alpha)];
         temp = [Vector(i,j,1) ; Vector(i,j,2) ; Vector(i,j,3)];
         temp = Ry * temp;
         Vector(i,j,1) = temp(1,1);
         Vector(i,j,2) = temp(2,1);
         Vector(i,j,3) = temp(3,1);
        elseif (direction == 'z')
         Rz = [cos(alpha*i) -sin(alpha*i) 0;sin(alpha*i) cos(alpha*i) 0; 0 0 1];
         temp = [Vector(i,j,1) ; Vector(i,j,2) ; Vector(i,j,3)];
         temp = Rz * temp;
         Vector(i,j,1) = temp(1,1);
         Vector(i,j,2) = temp(2,1);
         Vector(i,j,3) = temp(3,1);
        end
    end
end
end

