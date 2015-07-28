%% Backwardstep
% Daniel Calderon, September 2012
%
%
%
%

function Bhatfinal = backwardstep(X,y)

fun = @(XT,yT,Xt,yt)...
      sum((yt - Xt*leastsquares(XT,yT)).^2);

fs = sequentialfs(fun,X,y,'direction','backward');
index = find(fs);

Xfinal = zeros(size(X,1),length(index));

for ii = 1:length(index)
    Xfinal(:,ii) = X(:,index(ii));
end

Bhat = leastsquares(Xfinal,y);
Bhatfinal = zeros(8,1);
for jj = 1:length(index)
    Bhatfinal(index(jj)) = Bhat(jj);
end


end