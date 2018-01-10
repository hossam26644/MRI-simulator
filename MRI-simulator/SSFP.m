function [Kspace]=SSFP(Kspace,Vector,RfAngle,Size,n,TE,DT,Tissue)

global tagging T1Prep T2Prep;
if (T1Prep ==1)
    Vector = T1prep(Vector,Size);
elseif(T2Prep==1)
    Vector = T2prep(Vector,Size);
elseif(tagging==1)
    Vector = Tagging(Vector,Size);
end
% Vector = Tagging(Vector,Size);
% Vector = T1prep(Vector,Size);
% Vector = T2prep(Vector,Size);


%RF EFFECT
    Vector = Rotation(RfAngle,Vector,Size,'y');
    alpha2=(2*pi/Size)*(n);
    %Gy EFFECT
    Vector = Rotation(alpha2,Vector,Size,'z');
    %D&R  TE EFFECT
    Vector = Dec_Rec(TE,Tissue,Vector,Size);
    for m =1:Size
        alpha3=(2*pi/Size);
        %Gx EFFECT 
        Vector=Gx(alpha3,Vector,Size);
       % imshow(Vector(:,:,2),[])
        %Read Out
        Kspace= Sum(Kspace,Vector,Size,n,m);
    end
        Vector = Dec_Rec(DT,Tissue,Vector,Size); 
    %D&R TR-TE EFFECT   
  %--------------------> SSFP
  Vector = Rotation(-RfAngle,Vector,Size,'y');
    alpha2=(2*pi/Size)*(n);
    %Gy EFFECT
    Vector = Rotation(-alpha2,Vector,Size,'z');
    for m =1:Size
        alpha3=(2*pi/Size);
        %Gx EFFECT 
        Vector=Gx(-alpha3,Vector,Size);

        %Read Out
    end
   %D&R TR-TE EFFECT  
end