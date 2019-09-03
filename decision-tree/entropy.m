function H = entropy(y, opts)
% ENTROPY Compute the entropy of a multinomial distribution
%  H = ENTROPY(y, opts) compute the entropy of a multinomial distribution
%    given the observations in y (num_data x 1). opts.n_classes should have
%    the number of class labels.

n_classes = opts.n_classes;
p = histcounts(y, 1:n_classes+1);

% Set H to the entropy of the unnormalized multinomial distribution p
% Make sure the case where p_i=0 is handeled appropriately.
% %%%%%%% BEGIN Student's %%%%%%%%%%%%%
s = length(y);
p = p/s;
entries = -p.*log(p);
H = nansum(entries);
% %%%%%%% END Student's Code %%%%%%%%%%%%%
