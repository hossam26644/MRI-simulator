function [ Vector ] = Dec_Rec( TE , Tis , Vector , N )


    for i=1:N
        for j=1:N
            T1 = Tis(i,j,1);
            T2 = Tis(i,j,2);
            temp = [Vector(i,j,1) ; Vector(i,j,2) ; Vector(i,j,3)];
            decay = [exp(-TE/T2) 0 0;0 exp(-TE/T2) 0;0 0 exp(-TE/T1)];
            recovery = [0;0;1-exp(-TE/T1)];
            temp = (decay * temp) + recovery;
            Vector(i,j,1) = double(temp(1,1));
            Vector(i,j,2) = double(temp(2,1));
            Vector(i,j,3) = double(temp(3,1)); 
        end
    end
end
