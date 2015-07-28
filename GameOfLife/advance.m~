function An = advance(S,A)

An = A;

M = size(A,1);
N = size(A,2);

for i=2: M-2,	% dead border
for j=2: N-2,

    Amax = max(max(S(i-1:i+1,j-1:j+1))) % # of living neighbors
    
    [indx, indy] = find(S == Amax)
    
    if S(i,j) < Amax,				        % if alive but 
       			% lonely or crowded die
          An(i,j) = A(indx,indy);
    end

end
end

return