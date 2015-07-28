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


T = 1;
r0 = 30;
rmax = 50;
smax = pi;

time = linspace(0,T,1000);

s = zeros(1, length(time));
lambda = zeros(1,length(time));
ISI = zeros(1,length(time));
spikes = zeros(1,length(time));

figure()
for y = 1:100
    
    
        for j = 1:1000                                          % time loop 
            s(j) = time(j) * pi;                                     % Specified angles for Problem
            lambda(j) = r0 + (rmax - r0) * cos(s(j) - smax);        % Lambda Equation 1.15 from Dayan & Abbott
            
            ISI(j) = exprnd(lambda(j))/1000;                % Generate 1000 ISIs  
        end
        %
        lambdamax = max(lambda);                            % define lambdamax for thinning
        
        ISI = cumsum(ISI);
        last_spike = find(ISI>T,1,'first');
                                   % find where ISI exceeds the total Trial time
        ISI = ISI(1:last_spike-1); % last spiking time in T is last_spike-1
        
        spikes(y,:) = zeros(1,1000);                            % Generate Spikes at ISI locations
        for z = 1:length(ISI)                                   %
            ISI(z) = ceil(1000*ISI(z));                         %
            spikes(y,ISI(z)) = 1;                               %
            
                                                                % thinning using lambdamax
            u = rand;                                           % U
            if u > lambda(ISI(z))/lambdamax                     % Reject spike if u less than ratio
                spikes(y,ISI(z)) = 0;                           %
            end                                                 %
        end
             
            
end
      
    plotvals = randi(100,1,5);
    for z = 1:5 
        subplot(5,1,z)
        plot([time;time],[spikes(plotvals(z),:);zeros(size(time))])
        grid off
        axis on
        set(gca,'Ytick',[])
        box off
    end
