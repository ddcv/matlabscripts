%% Spike train Hwk 3 ELEC 548
% By Dan Calderon, 10/10/12
%
%
%
%
% simulated motor cortical neuron that has a cosine tuning curve described in equation (1.15) in Theoretical Neuroscience
% (TN, by Dayan and Abbott):
% lambda(s) = r0 + (rmax-r0) cos(s - smax)
% where lambda is the firing rate (in spikes per second), s is the reaching angle of the arm, smax is the
% reaching angle associated with the maximum response rmax, and r0 is an o?set that shifts
% the tuning curve up from the zero axis. Let r0 = 30, rmax = 50, and smax
% = pi.

%% Initialization
k = [-3 -2 -1 0 1 2 3 4];

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
countsum = zeros(length(k),50);
counttrial = zeros(length(k),100);
countmean = zeros(1,length(k));
countvar = zeros(1,length(k));


%% Main Loop
for i = 1:length(k)
    figure()
    for y = 1:100
        s(i) = k(i) * pi/4;                                     % Specified angles for Problem
    
        lambda(i) = r0 + (rmax - r0) * cos(s(i) - smax);        % Lambda Equation 1.15 from Dayan & Abbott
  
        for j = 1:1000                                          % Generate 1000 ISIs 
            ISI(i,j) = exprnd(lambda(i))/1000;                  %  
        end                                                     %
    
        ISIcum = cumsum(ISI(i,:));                              % Describe ISIs cumulatively
        
        last_spike    = find(ISIcum>T,1,'first');               % find where ISI exceeds the total Trial time 1 sec                                                              
        ISIcum        = ISIcum(1:last_spike-1);                 % last spiking time in T is last_spike-1
        ISIout        = ISI(i,1:last_spike-1);                  % last spiking time in T is last_spike-1

        
        spikes(i,:) = zeros(1,1000);                            % Reset spikes vector for new spike train
        
        for z = 1:length(ISIcum)                                % Insert Spike locations into empty spike train vector
            ISIcum(z) = ceil(1000*ISIcum(z));                   %
            spikes(i,ISIcum(z)) = 1;                            %
        end
        
        counttrial(i,y) = sum(spikes(i,:));                     % Key contribution for Problem 3c.
        counttotal = sum(counttrial(i,:),2);
        countmean(i) = sum(counttrial(i,:),2)/100;              % Useful to
                                                                % plot mean for problem 3c.
        countvar(i) = var(counttrial(i,:));
        
%        for w = 1:50                                            % Histogram counts for Problem 3b.
%            edge1 = (w-1)*20 + 1;                               %
%            edge2 = (w-1)*20 + 20;                              %
%            count(w,y) = sum(spikes(i,edge1:edge2));            %
%        end   
    end
       
    [f, x] = hist(ISIout);     % create the histogram from data and note frequencies (f)  and locations (x)
    
    lparam = expfit(x);                  % Determines lambda parameter for poisson pdf given x locations
    
    %% to do
    expo = exp(-x/lparam);        % analytical pdf of the exponential distribution
        
    
    %% NEED TO FIGURE OUT
    bar(x,f/trapz(x,f)); hold on  
                                  % normalizes hist frequency using the trapz function as shown in:  
                                  % http://stackoverflow.com/questions/5320677/how-to-normalize-a-histogram-in-matlab
    stem(x,expo,'r'); hold off 
    
end



   




