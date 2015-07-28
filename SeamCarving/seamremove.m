%% Seam Removal Function

function [Out Mnew] = seamremove(I,M,vseam)
[n,m] = size(I);
Out = zeros(n,m-1);
Mnew = zeros(n,m-1);

for i = 1:n
    if vseam(i) == 1
        Out(i,:) = I(i,2:end);
        Mnew(i,:) = M(i,2:end);
    elseif vseam(i) == m
        Out(i,:) = I(i,1:m-1);
        Mnew(i,:) = M(i,1:m-1);
    else
        Out(i,:) = [I(i,1:vseam(i)-1) I(i,vseam(i)+1:end)];
        Mnew(i,:) = [M(i,1:vseam(i)-1) M(i,vseam(i)+1:end)];
    end
end     
    

end