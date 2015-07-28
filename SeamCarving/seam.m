%% seam.m
%
%
%
% Dynamic Programming Part 2: Backtrack function
%
%
function [Out vseam] = seam(I,M,nsum,vseam)
[n,m] = size(M);
Out = zeros(n,m-1,3);

%% Initial min that finds min endpoint
[foo ind] = min(M(n,:));
vseam(n,nsum) = ind;

%% Seam Removal
if vseam(n,nsum) == 1                           %For First column:
        Out(n,:,:) = I(n,2:end,:);              
elseif vseam(n,nsum) == m                       %For last column:
        Out(n,:,:) = I(n,1:m-1,:);                 
else                                            %Otherwise:
        Out(n,:,:) = [I(n,1:vseam(n,nsum)-1,:) I(n,vseam(n,nsum)+1:end,:)]; %remove
end 

%% backtracking for loop
for ii = n-1:-1:1
    
    if ind == 1
        temp = [100000, M(ii,ind), M(ii,ind+1)];    %For First Column
    elseif ind == m
        temp = [M(ii,ind-1), M(ii,ind), 100000];    %For Last Column
    else
        temp = [M(ii,ind-1), M(ii,ind), M(ii,ind+1)];%Otherwise
    end
    [foo indy] = min(temp);                         %Set index of min;
    if indy == 1
        ind = ind-1;
    elseif indy == 3
        ind = ind+1;
    end
    vseam(ii,nsum) = ind;
    %% Seam Removal
    if vseam(ii,nsum) == 1                          %For first column
            Out(ii,:,:) = I(ii,2:end,:);
    elseif vseam(ii,nsum) == m                      %For last column:
            Out(ii,:,:) = I(ii,1:m-1,:);              
    else                                            %Otherwise:
            Out(ii,:,:) = [I(ii,1:vseam(ii,nsum)-1,:) I(ii,vseam(ii,nsum)+1:end,:)]; %remove
    end
end


end