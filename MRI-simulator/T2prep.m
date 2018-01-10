function [Vector] = T2prep(Vector, Size)
global T2Prep Tissue;
if T2Prep ==1
  Vector = Rotation(pi/2,Vector,Size,'y');
  Vector = Rotation(pi, Vector, Size,'z');
  Vector = Dec_Rec(50,Tissue,Vector,Size);
  Vector = Rotation(-pi/2,Vector,Size,'y');

  
end
end


