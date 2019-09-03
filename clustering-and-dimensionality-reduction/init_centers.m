%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CSC C11 - Assignment 3 - K-Means++ Center Initialization Algorithm
%
% This function implements K-Means++ center initialization algorithm 
% for a set of input vectors, and an *initial* set of cluster centers.
%
% function [centers]=init_centers(data,k,init_algo)
%
% Inputs: data - an array of input data points size n x d, with n 
%                input points (one per row), each of length d.
%         k - number of clusters
%         init_algo - the center initialization algorithm to use for 
%                     the k centers. The default is random initialization,
%		      but when init_algo is "kmeans++" it returns initial
%                     centers based on the kmeans++ alg.
%
% Outputs: centers - Initial cluster centers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [centers] = init_centers(data,k,init_algo)
  centers = zeros(k, size(data, 2));

  if (strcmpi(init_algo, "kmeans++"))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TO DO: Complete this part so that your code chooses k initial
    %        centers using K-Means++ algorithm. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % runs k-means++ initialization algorithm
    n = size(data, 1);
    d = size(data, 2);
    first_center = data(ceil(rand * n), :);
    centers = first_center;
    next_center = first_center;
    distances = [];
    for i=1:k
        this_center = next_center;
        distances_to_this_center = data - repmat(this_center, n, 1);
        distances_to_this_center = distances_to_this_center .^ 2;
        distances_to_this_center = sum(distances_to_this_center')';
        distances = [distances'; distances_to_this_center']';
        
        % Get the new/next center by sampling
        if i < k
            %disp(size(distances, 1));
            %disp(size(distances, 2));
            probabilities = distances';
            if i > 1
                probabilities = min(distances'); 
            end
            probabilities = probabilities / sum(probabilities);
            %disp(size(probabilities, 1));
            %disp(size(probabilities, 2));
            CDF = cumsum(probabilities);
            z = rand;
            m = find(CDF >= z);
            idx = m(1);
            %disp(idx);
            next_center = data(idx, :);
            centers = [centers; next_center];
        end;
    end;
  else
    % choose initial centers randomly
    random_permutation = randperm(size(data, 1), k);
    centers = data(random_permutation, :);
  end;
