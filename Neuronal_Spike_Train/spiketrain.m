%% Spike train Hwk 3 ELEC 548
% By Dan Calderon, 10/10/12
%
%
%
%
% simulated motor cortical neuron that has a cosyne tuning curve described in equation (1.15) in Theoretical Neuroscience
% (TN, by Dayan and Abbott):
% lambda(s) = r0 + (rmax-r0) cos(s - smax)
% where lambda is the firing rate (in spikes per second), s is the reaching angle of the arm, smax is the
% reaching angle associated with the maximum response rmax, and r0 is an o?set that shifts
% the tuning curve up from the zero axis. Let r0 = 30, rmax = 50, and smax
% = pi.

k = [0 1 2 3 4 5 6 7];

T = 1;
r0 = 30;
rmax = 50;
smax = pi;

lambda = zeros(1,length(k));
s = zeros(1, length(k));
ISI = zeros(length(k),100);
spikes = zeros(length(k),100);
time = linspace(0,T,100);

for i = 1:length(k)
    for y = 1:5
        s(i) = k(i) * pi/4;
    
        lambda(i) = r0 + (rmax - r0) * cos(s(i) - smax);
    
        for j = 1:100
            ISI(i,j) = exprnd(lambda(i))/100; %Generate 100 ISIs  
        end
    
        ISI = cumsum(ISI(i,:));
        last_spike = find(ISI>T,1,'first');
                                   % find where ISI exceeds the total Trial time
        ISI = ISI(1:last_spike-1); % last spiking time in T is last_spike-1
        spikes(i,:) = zeros(1,100);
        for z = 1:length(ISI)
            ISI(z) = ceil(100*ISI(z));
            spikes(i,ISI(z)) = 1;
        end
        
        if i ==1
            subplot(17,3,18+y*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i ==2
            subplot(17,3,y*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 3
            subplot(17,3,02+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 4
            subplot(17,3,01+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 5
            subplot(17,3,19+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 6
            subplot(17,3,37+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 7
            subplot(17,3,38+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        elseif i == 8
            subplot(17,3,39+(y-1)*3)
            plot([time;time],[spikes(i,:);zeros(size(time))])
        end
        grid off
        axis on
        set(gca,'Ytick',[])
        box on
    end
end


