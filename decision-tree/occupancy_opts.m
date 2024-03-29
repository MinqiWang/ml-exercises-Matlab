function opts = occupancy_opts()
% OCCUPANCY_OPTS Options for the occupancy dataset

% %%%%%%% BEGIN Student's %%%%%%%%%%%%%
opts = {};

% Set this flag to print additional debugging info
opts.debug = false;

% Tree options
opts.n_classes = 2;  % Number of class labels
opts.max_depth = 10;  % Maximum depth of a decision tree
opts.min_leaf_num = 10;  % Minimum number of data left before creating a leaf
opts.min_entropy = 0.001;  % Minimum entropy to make a leaf
opts.split_retry = 10;  % Number of retries if no split had non-zero info-gain

% Forest options
opts.num_trees = 20;
opts.feats_percent = .9;  % Percent of features used for each tree
opts.data_percent = .5;  % Perceent of training data used for each tree
% %%%%%%% END Student's Code %%%%%%%%%%%%%
