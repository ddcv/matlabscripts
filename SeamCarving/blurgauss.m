%% Blurring using Derivative of Gaussian

function [gau dgau2D] = blurgauss(sigma)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  This is code from MATLAB's canny edge function
    GaussianDieOff = .0001;
    
    % Design the filters - a gaussian and its derivative
    
    pw = 1:30; % possible widths
    ssq = sigma^2;
    width = find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff,1,'last');
    if isempty(width)
        width = 1;  % the user entered a really small sigma
    end
    
    t = (-width:width);
    gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq);     % the gaussian 1D filter
    
    % Find the directional derivative of 2D Gaussian (along X-axis)
    % Since the result is symmetric along X, we can get the derivative along
    % Y-axis simply by transposing the result for X direction.
    [x,y]=meshgrid(-width:width,-width:width);
    dgau2D=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);
end

%% Alternative derivative of Gaussian
%dvec = linspace(-floor(ksize/2),floor(ksize/2),ksize)/(ksigma^2);  %partial derivative kernel vector (analytically derived)
%dvec2 = dvec'*dvec;             % Create matrix of x and y partial derivatives
%dH = dvec2.*H;                  % 2D derivative of gaussian kernel
%dH = dH/norm(dH);               % normalize
%dXvec = repmat(dvec,ksize,1);
%dXvec = dXvec .* H;               % dx partial derivative
%dYvec = repmat(dvec',1,ksize);
%dYvec = dYvec .* H;               % dy partial derivative
%dX = imfilter(I,dXvec);          %Blurred Convolution Operator = Differentiation
%dY = imfilter(I,dYvec);          %Blurred Convolution Operator = Differentiation
%e1 = imfilter(I,dH);
%e1 = dX + dY;
