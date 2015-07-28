%% LASSO
% Daniel Calderon, September 2012
%
% Implementation of Boyd's IPM method for L1-regularized LASSO
%
%

function Bhat = lasso(X,y)


Bhat = l1_ls(X,y,10);

end