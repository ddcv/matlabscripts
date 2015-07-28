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

%% Initialization
k = [0 1 2 3 4 5 6 7];

T = 1;
r0 = 30;
rmax = 50;
smax = pi;

lambda = zeros(1,length(k));
s = zeros(1, length(k));

ISI = zeros(length(k),1000);
spikes = zeros(length(k),1000);
time = linspace(0,T,1000);
count = zeros(50,100);
countsum = zeros(8,50);
counttotal = zeros();


%% Main Loop
for i = 1:length(k)
    for y = 1:100
        s(i) = k(i) * pi/4;                                     % Specified angles for Problem
    
        lambda(i) = r0 + (rmax - r0) * cos(s(i) - smax);        % Lambda Equation 1.15 from Dayan & Abbott
    
        for j = 1:1000                                          % Generate 100 ISIs 
            ISI(i,j) = exprnd(lambda(i))/1000;                  %  
        end                                                     %
    
        ISI = cumsum(ISI(i,:));                                 % Describe ISIs cumulatively
        
        last_spike = find(ISI>T,1,'first');                     % find where ISI exceeds the total Trial time 1 sec                                                              
        ISI = ISI(1:last_spike-1);                              % last spiking time in T is last_spike-1
        
        spikes(i,:) = zeros(1,1000);                            % Reset spikes vector for new spike train
        
        for z = 1:length(ISI)                                   % Insert Spike locations into empty spike train vector
            ISI(z) = ceil(1000*ISI(z));                         %
            spikes(i,ISI(z)) = 1;                               %
        end
%        counttotal(y) = sum(spikes(i,:));                       % Key contribution for Problem 3c.
        
        for w = 1:50                                            % Histogram counts for Problem 3b.
            edge1 = (w-1)*20 + 1;                               %
            edge2 = (w-1)*20 + 20;                              %
            count(w,y) = sum(spikes(i,edge1:edge2));            %
        end                                                     %
        
    end
    
        if i ==1
            subplot(3,3,6)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i ==2
            subplot(3,3,3)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 3
            subplot(3,3,2)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 4
            subplot(3,3,1)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 5
            subplot(3,3,4)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 6
            subplot(3,3,7)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 7
            subplot(3,3,8)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        elseif i == 8
            subplot(3,3,9)
            countsum(i,:) = sum(count,2)/100;
            bar(countsum(i,:))
        end    
    
end


