%% Partial Least Squares Regression
% Daniel Calderon, September 2012
%
%
%
%

function Bhat = PLSregression(X,y)

%for k = 1:8
 [XL, YL, XS,YS, Bhat] = plsregress(X,y,8); 
%end
Bhat = Bhat(2:end);
end