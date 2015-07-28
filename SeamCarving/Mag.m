%% Mag.m
%
% This is the primary code for calculating the gradient map, which is Part 1 of the 
% dynamic-programming-based seam
% carving. Part 2(backtracking function) is found in seam.m. This code has
% two parts itself: The first part is the blur and differentiation that
% creates the Gradient Map. The Second Part marches down the columns of the gradient map
% calculating the optimal M cumulative energy function for each M(i,j).
%
% usage: type in Mag(I,gau,dgau2D), where I is the input n by m by 3 color image, and
% gau is the 1D gaussian kernel, and dgau2D is the 2D derivative of gaussian kernel.
%                                    
%  example:  M = Mag(I,gau,dgau2D)
%
function M = Mag(I,gau,dgau2D)
[n,m,~] = size(I);
M = zeros(n,m);         % Initialize cumulative energy minimum

%% Mostly borrowed from MATLAB's edge.m Canny Edge Detector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Convolve the filters with the image in each direction
    % The canny edge detector first requires convolution with
    % 2D Gaussian, and then with the derivative of a Gaussian.
    % Since Gaussian filter is separable, for smoothing, we can use
    % two 1D convolutions in order to achieve the effect of convolving
    % with 2D Gaussian.  We convolve along rows and then columns.
    
    %smooth the image out
    Ix =zeros(n,m,3);
    Iy = Ix;
    for k = 1:3
%        ISmooth=imfilter(I(:,:,k),gau,'conv','replicate');   % run the filter across rows
%        ISmooth=imfilter(ISmooth,gau','conv','replicate'); % and then across columns
    
    %apply directional derivatives
        Ix(:,:,k) = imfilter(I(:,:,k), dgau2D, 'conv','replicate');
        Iy(:,:,k) = imfilter(I(:,:,k), dgau2D', 'conv','replicate');
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Ix = mean(Ix,3);
    Iy = mean(Iy,3);
%    Ix = Ix/norm(Ix,1);
%    Iy = Iy/norm(Iy,1);
%    edisp = sqrt(Ix.^2 + Iy.^2);
%    edisp = e1;
    edisp = abs(Ix) + abs(Iy);

%% Alternative to imfilter (more efficient?)
%fftY = fft2(Y);
%fftH = fft2(H,n,m);
%fftZ = fftY.*fftH;                 %Blurring using 2-D FFT instead of imfilter
%Z = ifft2(fftZ);                   %unresolved bug: Why fft edges != imfilter edges?
%imagesc(Z)                         %Probably simple solution: must re-visit when have time

%% Dynamic Programming Part 1: March Down Gradient Map
%Calculate M

M(1,:) = edisp(1,:);
    for i = 2:n
        for j= 1:m
            if j == 1
                temp = [M(i-1,j) M(i-1,j+1)];
            elseif j == m
                temp = [M(i-1,j-1) M(i-1,j)];
            else
                temp = [M(i-1,j-1) M(i-1,j) M(i-1,j+1)];
            end
            M(i,j) = edisp(i,j) + min(temp);
        end
   end


end