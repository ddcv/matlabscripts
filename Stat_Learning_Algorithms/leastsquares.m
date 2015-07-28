%% Least Squares
% Daniel Calderon, September 2012
%
%
%
%
function Bhat = leastsquares(X,y)


Bhat = (X'*X)\ (X' * y);

end