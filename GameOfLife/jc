%
% John Conway's game of life
%
% usage   jc(100)
%

function jc(gen)

A = zeros(25,40);	% 25-by-40 starting template
A(11:15,18) = 1;	% 1 = alive, 0 = dead
A(11,20) = 1;
A(15,20) = 1;
A(11:15,22) = 1;
%A = round(rand(25,40)/1.8);

C = zeros(25,40,3);

figure(1)
set(gcf,'doublebuffer','on');	% kill flicker

for itc = 1:gen,	% play for gen generations

    C(:,:,1) = (A>0);    % living are red
    image(C)             % built-in multi-patch

    title(['Generation ' num2str(itc)],'fontsize',16)
    axis off
    pause(.5)

    A = march(A);

end

return

% step in time

function sA = march(A)

sA = A;

for i=2:24,	% dead border
for j=2:39,

    nn = sum(sum(A(i-1:i+1,j-1:j+1)))-A(i,j);   % # of living neighbors

    if A(i,j),				        % if alive but 
       if (nn < 2 | nn > 3)			% lonely or crowded die
          sA(i,j) = 0;
       end
    else					% if dead and
       if nn==3,				% threerounded arise
          sA(i,j) = 1;
       end
    end

end
end