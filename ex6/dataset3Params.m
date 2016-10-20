function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

newC = 0.01;
newSigma = 0.03;
finalC = 0;
finalSigma = 0;
previousMean = 0;

%model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);


%model= svmTrain(X, y, newC, @(x1, x2) gaussianKernel(x1, x2, newSigma)); 


%predictions = svmPredict(model, Xval)
%previousMean = mean(double(predictions ~= yval));
previousMean = 1000.00;

allvals = [0.01;0.03;0.1;0.3;1;3;10;30];

for k = 1:8,
	newC = allvals(k);
	for l = 1:8,

		newSigma = allvals(l);


		model = svmTrain(X, y, newC, @(x1, x2) gaussianKernel(x1, x2, newSigma));
		predictions = svmPredict(model, Xval);
		newMean = mean(double(predictions ~= yval));

		%fprintf('\nThe new mean  = %f\n', newMean);
		%fprintf('\nThe previousMean  = %f\n', previousMean);
		%fprintf('\nThe new sigma is   = %f\n', newSigma);
		%fprintf('\nThe new C is   = %f\n', newC);

		if newMean < previousMean
			previousMean = newMean;
			finalC = newC;
			finalSigma  = newSigma;
			%fprintf('Bazinga\n');
			%fprintf('\nThe fincal C = %f\n', finalC);
			%fprintf('\nThe fincal sigma = %f\n', finalSigma);
		endif;

	end;
end;

C = finalC;
sigma = finalSigma;






% =========================================================================

end
