function evodisp(A,An)

A

An
            
[xplace1,yplace1] = find(An == A & An ==1);

[xplace2,yplace2] = find(An == A & An ==0);

[xplace3,yplace3] = find(An ~= A & An ==0);

[xplace4,yplace4] = find(An ~= A & An ==1);

figure(1)
set(gcf,'doublebuffer','on');	% kill flicker

plot(yplace1,xplace1,'b.')
hold on
plot(yplace2,xplace2,'r.') 
plot(yplace3,xplace3,'y.')
plot(yplace4,xplace4,'g.')

            
return 