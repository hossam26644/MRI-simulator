function [Vector] = T1prep(Vector, Size)
global T1Prep Tissue;
if T1Prep ==1
    
  Vector = Rotation(pi,Vector,Size,'y');
  Vector = Dec_Rec(300,Tissue,Vector,Size);

end
end
