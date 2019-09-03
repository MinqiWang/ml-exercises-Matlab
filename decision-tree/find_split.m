function [split_dim, split_value, max_info_gain] = find_split(X, y, opts)
% FIND_SPLIT find an optimal split over a random split dimension
%   [SD, SV, IG] = FIND_SPLIT(X, y, opts) randomly chooses an input dimension
%     of the training data X (num_data x num_features) and returns a value
%     to split data according to the rule X(:, dim) <= SV. The split value
%     maximizes the information gain from the all possible choices of a
%     split vaule.

[n_samples n_features] = size(X);

H = entropy(y, opts);

% Randomly choose the dimension for split
dim = randi(n_features);
split_dim = dim;

% Sort the data by values at split dim
[~, I] = sort(X(:, dim));
X = X(I, :);
y = y(I);
[u, v] = unique(X(:, dim));

% Iterate over split values and find the optimal split
% maximizing the information gain
% %%%%%%% BEGIN Student's %%%%%%%%%%%%%
% Initialize variables
max_info_gain = 0;
split_value = u(1);
% Loop only over the split values
for i = 1:size(u, 1)-1
    % Compute the information gain (cur_ig) of the split between u(i) and
    % u(i+1) by computing the entropy of each subset of data (left_e, right_e).
    split_index = v(i+1)-1;
    left_data = y(1:split_index);
    right_data = y(split_index+1:n_samples);
    left_e = entropy(left_data, opts);
    right_e = entropy(right_data, opts);
    
    if opts.debug
        fprintf('%.4f %.4f %.4f\n', H, left_e, right_e);
    end
    cur_ig = H - length(left_data)/n_samples*left_e - length(right_data)/n_samples*right_e;
    % Update if larger info gain
    if(cur_ig >= max_info_gain)
        max_info_gain = cur_ig;
        split_value = u(i);
    end
end
% %%%%%%% END Student's Code %%%%%%%%%%%%%
