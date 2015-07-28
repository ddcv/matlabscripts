%% Seamcarver.m
%
%
%
%  Umbrella function that implements seam carving on each picture
%

function Out = seamcarver(C,gau,dgau2D,nsum,ar)

n = size(C,1);
Out = double(C);
vseam = zeros(n,nsum);

for i = 1:nsum 
    Mnew = Mag(Out, gau, dgau2D);         %Calculates the energy minimum gradient map
    
    [Out vseam] = seam(Out,Mnew,i,vseam); %Calculates backtracking for vseam columns and determines add or remove  
end

if ar ==1                                 %if AR logical is True:
    Out = double(C);
    for i = 1:nsum
        Out = addcol(Out,vseam(:,i));     %Add columns through inverse time
    end
end

end
