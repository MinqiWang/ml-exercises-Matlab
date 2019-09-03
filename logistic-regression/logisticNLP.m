
function [ll, g] = logisticNLP(x1, x2, w, lambda)
% [ll, g] = logisticNLP(x1, x2, w, lambda);
% 
% Inputs:
%   x1 - array of exemplar measurement vectors for class 1.
%   x2 - array of exemplar measurement vectors for class 2.
%   w - an array of weights for the logistic regression model.
%   lambda - 1 / variance for an optional Gaussian weight decay 
%            prior on the logistic regression likelihood
%            NOTE: when lambda == 0, do not use a prior
% Outputs:
%   ll - negative log probability (likelihood) for the data 
%        conditioned on the model (ie w).
%   g - gradient of negative log data likelihood
%       (partial derivatives of ll w.r.t. elements of w)


% YOUR CODE GOES HERE.
if ~exist('lambda');
  lambda = 0;
end

[~, n1] = size(x1);
[~, n2] = size(x2);
x1 = [x1;ones(1, n1)];
x2 = [x2;ones(1, n2)];
c1 = log(logistic(x1, w));
c2 = log(ones(1, n2) - logistic(x2, w));
ll = - (sum(c1) + sum(c2));

g_c1 = sum((logistic(x1, w) - ones(1, n1)) .* x1, 2);
g_c2 = sum((logistic(x2, w)) .* x2, 2);
g = g_c1 + g_c2;

if lambda ~= 0
    alfa = 1 / lambda;
    p_w = (1 / ((2*pi*alfa)^(length(w)/2))) * exp(-w'*w/(2*alfa));
    ll = ll - log(p_w);
    g = w / alfa + g;
end
