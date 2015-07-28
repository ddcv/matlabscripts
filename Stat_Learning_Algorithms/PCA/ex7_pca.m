%%  Exercise 7 | Principle Component Analysis and K-Means Clustering
%   Daniel Calderon    November 2011


function [X_rec X_norm Z] = ex7_pca(X)

%  Before running PCA, it is important to first normalize X
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
[U, S] = pca(X_norm);


%  Project the data onto K = 8 dimension
K = 8;
    Z = projectData(X_norm, U, K);

    X_rec  = recoverData(Z, U, K);
    
end




function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);


% ============================================================

end

function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

U = zeros(n);
S = zeros(n);


sigma = 1/m * (X' * X);

[U,S,V] = svd(sigma);


% =========================================================================

end



function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

Z = zeros(size(X, 1), K);

U_reduce = U(:,1:K);

Z = X * U_reduce;



% =============================================================

end



function X_rec = recoverData(Z, U, K)
%RECOVERDATA Recovers an approximation of the original data when using the 
%projected data
%   X_rec = RECOVERDATA(Z, U, K) recovers an approximation the 
%   original data that has been reduced to K dimensions. It returns the
%   approximate reconstruction in X_rec.
%
X_rec = zeros(size(Z, 1), size(U, 1));


U_reduce = U(:,1:K);


X_rec = Z * U_reduce';

% =============================================================

end