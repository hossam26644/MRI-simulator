function [Vector] = Tagging(Vector, Size)
global tagging  ;
if tagging ==1
  Vector = Rotation(pi/2,Vector,Size,'y');
%for m = 1:Size
%  alpha3=(2*pi/Size)*m ;
  Vector=Rotation(pi,Vector,Size,'z');
   %Vector = RotationG( Vector, Size);

 % end

 % Vector = Dec_Rec(50,Tissue,Vector,Size);

  
  
  Vector = Rotation(-pi/2, Vector, Size,'y');
%  Temp = Vector(:,:,3)
%  imshow(Temp,[])

end
end
