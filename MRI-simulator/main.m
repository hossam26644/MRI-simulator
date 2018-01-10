function [img]= main(Type,Size,sequence,prep)

%sequence = xml2struct('GE.xml');
procedure = str2double(sequence.Children(2).Attributes.Value);
EchoTrain = str2double(sequence.Children(4).Attributes.Value);

global tagging T1Prep T2Prep Tissue ;
if (prep ==0)
        T1Prep = 0;T2Prep = 0;tagging = 0;
elseif(prep==1)
        T1Prep = 1;T2Prep = 0;tagging = 0;
elseif(prep==2)
        T1Prep = 0;T2Prep = 1;tagging = 0;
elseif(prep==3)
        T1Prep = 0;T2Prep = 0;tagging = 1;
end

RFAngle = pi/2;

Vector=zeros(Size,Size,3);
Vector(:,:,3)=1;
Kspace=zeros(Size,Size);
Tissue = Phantom(Size);
if Type == 1
    %T1 Weighted
    TE= 50;
    TR= 500;
    DT=TR-TE;    
else
    %T2 Weighted
    TE = 100;
    TR = 4000;
    DT=TR-TE;
end
for n = 1:ceil(Size / EchoTrain)     %-----------------------> Big loop ge sequences
    if (procedure == 1)  
     Kspace=GRE(Kspace,Vector,RFAngle,Size,n,TE,DT,Tissue);
    elseif (procedure == 1) 
     Kspace=FSEsignal(Kspace,Vector,RFAngle,Size,n,TE,DT,Tissue,EchoTrain);
    elseif (procedure == 1) 
     Kspace=SE(Kspace,Vector,RFAngle,Size,n,TE,DT,Tissue,EchoTrain);
    elseif (procedure == 1)
     Kspace=SSFP(Kspace,Vector,RFAngle,Size,n,TE,DT,Tissue);
    end

end

Kspace=fftshift(Kspace);
Fimage1=abs(ifft2(Kspace));
Fimage2=-abs(ifft2(Kspace));

%{
if FSE == 1
    N=Size;
Fimage11(1:Size/2,:)=Fimage1(Size/2:Size,:);
Fimage11(Size/2:Size,:)=Fimage1(1:Size/2,:);

Fimage2(1:N/2,:)=Fimage2(N/2:N,:);
Fimage2(N/2:N,:)=Fimage2(1:N/2,:);

end
%}
if Type == 1
    %T1 Weighted
    img = Fimage1;     
else
   % T2 Weighted
    img = Fimage2;
end
end

        
        

    
    

    

    
    
    