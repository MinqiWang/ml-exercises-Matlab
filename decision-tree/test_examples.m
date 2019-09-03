function test_examples(test_forest)
    % Test the decision tree and random forest implementation using 3
    % synthetic test.
    if nargin < 1
        test_forest = false;
    end
    example1(test_forest);
    example2(test_forest);
    example3(test_forest);
end

function acc = build_and_test(X, y, opts, test_forest)
    if test_forest
        root = build_forest(X, y, opts);
        p = predict_forest(X, root);
    else
        root = build_tree(X, y, opts);
        p = predict_tree(X, root);
    end
    acc = accuracy(p, y);
    fprintf('Training Accuracy: %.2f\n', acc);
end

function example1(test_forest)
    % 1D, #10, 2-class, linearly separable
    opts = default_opts();
    opts.feats_percent = 1;
    opts.min_leaf_num = 2;
    opts.debug = true;
    X = ones(10, 1);
    y = ones(10, 1);
    X(5:10) = 2;
    y(5:10) = 2;

    build_and_test(X, y, opts, test_forest);
end

function example2(test_forest)
    % 10D, #100, 2-class, random
    opts = default_opts();
    opts.debug = true;
    % %%%%%%% BEGIN Student's %%%%%%%%%%%%%
    X = randi(100, 100, 10);
    y = randi(2, 100, 1);

    % %%%%%%% END Student's Code %%%%%%%%%%%%%

    build_and_test(X, y, opts, test_forest);
end

function example3(test_forest)
    % XOR data
    % 0^0=0
    % 0^1=1
    % 1^1=0
    % 1^0=1
    opts = default_opts();
    opts.feats_percent = 1;
    % %%%%%%% BEGIN Student's %%%%%%%%%%%%%
    X = [0 0; 0 1; 1 1; 1 0];
    y = [0; 1; 0; 1];
    % %%%%%%% END Student's Code %%%%%%%%%%%%%

    build_and_test(X, y, opts, test_forest);
end
