%% Elastic Net
% Daniel Calderon, September 2012
%
%
%
%

function Bhat = elastic(X,y)


Bhat = glmnet(X,y);
end