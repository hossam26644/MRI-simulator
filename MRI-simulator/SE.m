function [Kspace]=SE(Kspace,Vector,RFAngle,Size,n,TE,DT,Tissue,EchoTrain)

%RF EFFECT
Vector = Tagging(Vector,Size);
Vector = T1prep(Vector,Size);
Vector = T2prep(Vector,Size);


Vector = Rotation(RFAngle,Vector,Size,'y'); %RF angle
Vector = Dec_Rec(TE/EchoTrain,Tissue,Vector,Size);

    
for l = 1 : EchoTrain
    Vector = RotationY(pi,Vector,Size);
    dummy = (EchoTrain*n)-EchoTrain+l   ;
    alpha2=(2*pi/Size)*(dummy);
    %Gy EFFECT
    Vector = Rotation(alpha2,Vector,Size,'z');

    %D&R  TE EFFECT
    %Vector = Dec_Rec(TE/EchoTrain,Tissue,Vector,Size);
  if dummy <= Size 
    for m =1:Size
        alpha3=(2*pi/Size);
        %Gx EFFECT 
        Vector=Gx(alpha3,Vector,Size);

        %Read Out
        Kspace= Sum(Kspace,Vector,Size,dummy,m);
    end
    %{
    for m =1:Size
        alpha3=(2*pi/Size);
        %Gx EFFECT 
        Vector=Gx(alpha3,Vector,Size);

        %Read Out
         end
    %}
         
  end
  
    %D&R TR-TE EFFECT  
    Vector = Rotation(-alpha2,Vector,Size,'z');  
end  
Vector = Dec_Rec(DT,Tissue,Vector,Size);
end

  
