function y = unit(t)

%% creates the unit-step function

y = ones( size(t) ) .* (t >= 0) ;