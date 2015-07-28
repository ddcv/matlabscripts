function S = score(A,b)

S = A;

M = size(A,1);
N = size(A,2);

for i=2:M-2,	% dead border
for j=2:N-2,

    nC = sum(sum(A(i-1:i+1,j-1:j+1)))   % # of C neighbors

    % if C but 
       if A(i,j) == 1,			% lonely or crowded die
          S(i,j) = nC;
       else
           S(i,j) = nC*b;
       end 

end
end
end