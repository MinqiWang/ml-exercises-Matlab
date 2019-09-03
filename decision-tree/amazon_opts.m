function opts = amazon_opts()
% AMAZON_OPTS Options for the amazon dataset

% %%%%%%% BEGIN Student's %%%%%%%%%%%%%
opts = {};

% Set this flag to print additional debugging info
opts.debug = false;

% Tree options
opts.n_classes = 2;  % Number of class labels
opts.max_depth = 10;  % Maximum depth of a decision tree
opts.min_leaf_num = 30;  % Minimum number of data left before creating a leaf
opts.min_entropy = 0.001;  % Minimum entropy to make a leaf
opts.split_retry = 10;  % Number of retries if no split had non-zero info-gain

% Forest options
opts.num_trees = 2000;
opts.feats_percent = .005;  % Percent of features used for each tree
opts.data_percent = 1;  % Perceent of training data used for each tree
% %%%%%%% END Student's Code %%%%%%%%%%%%%
