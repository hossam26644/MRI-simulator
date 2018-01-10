function [Tissue] = Phantom(N)

P = phantom('Modified Shepp-Logan',N);

%initializing T1,T2,PD and T2* for each tissue

WMT1 = 510 ;    WMT2 = 67;      WMT2star = 6.7;   WMN = 0.61;
GMT1 = 760;     GMT2 = 77;      GMT2star = 7.7;   GMN = 0.69;
EdemaT1 = 900;  EdemaT2 = 126;  EdemaT2star=12.6;  EdemaN =0.86;
CSFT1=2350;     CSFT2=180;      CSFT2star = 18;     CSFN = 1;


% Four phantoms in the matrix 
Tissue(:,:,1)=P;
Tissue(:,:,2)=P;
Tissue(:,:,3)=P;
Tissue(:,:,4)=P;

for i = 1:N
    for j = 1:N 

% for layer one
if ((Tissue(i,j,1))==-5.551115123125783e-17)
    Tissue(i,j,1)=WMT1;
else if ((Tissue(i,j,1)==0))
    Tissue(i,j,1)=GMT1;
   %else if (((Matrix(i,j,1)==0.200000000000000)||((Matrix(i,j,1)==0.300000000000000))))
    %Matrix(i,j,1) = EdemaT1;
       else if ((Tissue(i,j,1)==1))
                Tissue(i,j,1) = CSFT1;
        else Tissue(i,j,1) = EdemaT1;
           end
      end
end

% for layer two
if ((Tissue(i,j,2))==-5.551115123125783e-17)
    Tissue(i,j,2)=WMT2;
else if ((Tissue(i,j,2)==0))
    Tissue(i,j,2)=GMT2;
       else if ((Tissue(i,j,2)==1))
                Tissue(i,j,2) = CSFT2;
        else Tissue(i,j,2) = EdemaT2;
           end
      end
end

% for layer three
if ((Tissue(i,j,3))==-5.551115123125783e-17)
    Tissue(i,j,3)=WMT2star;
else if ((Tissue(i,j,3)==0))
    Tissue(i,j,3)=GMT2star;
       else if ((Tissue(i,j,3)==1))
                Tissue(i,j,3) = CSFT2star;
        else Tissue(i,j,3) = EdemaT2star;
           end
      end
end

% for layer four
if ((Tissue(i,j,4))==-5.551115123125783e-17)
    Tissue(i,j,4)=WMN;
else if ((Tissue(i,j,4)==0))
    Tissue(i,j,4)=GMN;
       else if ((Tissue(i,j,4)==1))
                Tissue(i,j,4) = CSFN;
        else Tissue(i,j,4) = EdemaN;
           end
      end
end


    end
end
end
