function [Kspace]=Sum(Kspace,Vector,N,n,m)

for i=1:N
        for j=1:N
            Kspace(n,m)= Kspace(n,m) + complex( Vector(i,j,1),Vector(i,j,2));
        end
end
end
        
  