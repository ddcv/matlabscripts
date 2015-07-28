%% Add Columns
%
%
% This is essentially seam.m without calculating the vseam index (they are
% provided to us already), and adding the vseam index value instead of
% removing it.
%
%
function Out = addcol(I,vseam)
[n,m] = size(I(:,:,1));
Out = zeros(n,m+1,3);

for ii = 1:n
    if vseam(ii) == 1                           %For First Column:
        Out(ii,:,:) = [I(ii,1,:) I(ii,:,:)];       
    elseif vseam(ii) == m                       %For last column:
        Out(ii,:,:) = [I(ii,:,:) I(ii,m,:)];
    else                                        %Otherwise:
        Out(ii,:,:) = [I(ii,1:vseam(ii),:) I(ii,vseam(ii),:) I(ii,vseam(ii)+1:end,:)];
    end

end