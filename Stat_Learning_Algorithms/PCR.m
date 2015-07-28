%% Principal Components Regression
% Daniel Calderon, September 2012
%
%
%
%

function Bhat = PCR(X,y)

[X_rec X_norm Z] = ex7_pca(X);

Bhat = leastsquares(X_rec,y);


end