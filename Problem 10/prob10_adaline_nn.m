function [] = prob10_adaline_nn()
    % Define the patterns
    class_A = [0 0; 0 1; 1 0; -1 -1];
    class_B = [2.1 0; 0 -2.5; 1.6 -1.6];

    % Define the targets
    targets_A = ones(size(class_A, 1), 1);
    targets_B = -ones(size(class_B, 1), 1);

    % Combine the patterns and targets
    inputs = [class_A; class_B]';
    targets = [targets_A; targets_B]';

    % Initialize the weights and bias
    weights = rand(1, size(inputs, 1));
    bias = rand;

    % Define the learning rate
    learning_rate = 0.01;

    % Train the network
    for epoch = 1:100
        for i = 1:size(inputs, 2)
            % Compute the output
            output = weights * inputs(:, i) + bias;
            
            % Compute the error
            error = targets(i) - output;
            
            % Update the weights and bias
            weights = weights + learning_rate * error * inputs(:, i)';
            bias = bias + learning_rate * error;
        end
    end
end