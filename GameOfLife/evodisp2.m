function evodisp2(A,An)

map = [0 0 1; 1 0 0; 1 1 0; 0 1 0];

colormap(map)

display = An;

display(display == A & display ==1) = 1;

display(display == A & display ==0) = 2;

display(display ~= A & display ==0) = 3;

display(display ~= A & display ==1) = 4;

figure(1)
set(gcf,'doublebuffer','on');	% kill flicker

axis off

image(display)

            
return 