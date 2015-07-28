function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


%h = X  * theta;
h(:,1) = X(:,1) * theta(1); 
h(:,2) = X(:,2) * theta(2);
%J = sum((h - y).^2)/ (2*m);
J = sum ((h(:,1) - y).^2 + (h(:,2) - y).^2) / (2*m);


% =========================================================================

end
