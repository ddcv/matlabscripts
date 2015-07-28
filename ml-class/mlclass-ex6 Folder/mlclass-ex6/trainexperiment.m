function error = trainexperiment

% SVM Parameters
    Cvec = [0.01 0.03 0.1 0.3 1 3 10 30]';
    sigmavec = [0.01 0.03 0.1 0.3 1 3 10 30]';
    m = length(Cvec);
    n = length(sigmavec);

    error = zeros(m,n);

    % Load from ex6data3: 
    % You will have X, y in your environment
    load('ex6data3.mat');
    predictions = zeros(length(yval),1);
    for i = 1:m
        for j = 1:n
        % Train the SVM
            model= svmTrain(Xval, yval, Cvec(i), @(x1, x2) gaussianKernel(x1, x2, sigmavec(j)));

            predictions = svmPredict(model,Xval);
            
            error(i,j)= mean(double(predictions ~= yval));
        end
    end
   

end