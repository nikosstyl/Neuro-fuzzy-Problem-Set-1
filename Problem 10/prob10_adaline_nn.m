function [weights, bias, epoch] = prob10_adaline_nn(bool_export_plots)

    if nargin ~= 1
        bool_export_plots = false;
    end

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
    weights = [0.5 0.5];
    bias = 0.5;

    % Define the learning rate
    learning_rate = 0.01;
    
    % Define the maximum number of epochs and error threshold
    max_epochs = 1e4;
    error_threshold = eps;

    mean_squared_error_old = 0;    

    figure(1);
    a1 = axes;
    figure(2);
    a2 = axes;
    
    set(a1, "FontName", "Times New Roman");
    set(a2, "FontName", "Times New Roman");
    xlabel(a1,"Iterations", "FontName", "Times New Roman");
    title(a1, "Weights", "FontName", "Times New Roman");
    xlabel(a2,"Iterations", "FontName", "Times New Roman");
    title(a2, "Bias", "FontName", "Times New Roman");
    
    hold(a1, "on");
    grid(a1, 'on');
    hold(a2, "on");
    grid(a2, 'on');

    % Train the network
    for epoch = 1:max_epochs
        total_error = 0;
        for i = 1:size(inputs, 2)
            % Compute the output
            output = weights * inputs(:, i) + bias;
            
            % Compute the error
            error = targets(i) - output;
            total_error = total_error + error^2;
            
            % Update the weights and bias
            weights = weights + 2*learning_rate * error * inputs(:, i)';
            bias = bias + 2*learning_rate * error;
        end

        mean_squared_error = total_error / size(inputs, 2);

        plot(a1, epoch, weights(1), 'x', 'Color', [0.00,0.45,0.74]);
        plot(a1, epoch, weights(2), '*', 'Color', [0.85,0.33,0.10]);
        plot(a2, epoch, bias, 'o', 'Color', [0.93,0.69,0.13]);

        % Check if the total error is below the threshold
        if abs(mean_squared_error - mean_squared_error_old) < error_threshold
            break;
        end

        mean_squared_error_old = mean_squared_error;
    end
    legend(a1, 'w_1', 'w_2');
    box(a1, "on");
    box(a2, "on");
    hold(a1, "off");
    hold(a2, "off");

    figure;
    a3 = axes;
    x = linspace(-1, 2.5);
    y = -(weights(1)*x + bias) / weights(2);
    plot(a3, x, y, 'Color', [0.47,0.67,0.19], 'LineWidth', 1.2);
    set(a3, "FontName", "Times New Roman");
    grid(a3, 'on');
    xlabel(a3, "X", "FontName", "Times New Roman");
    ylabel(a3, "Y", "FontName", "Times New Roman");
    hold on;
    plot(a3, class_A(:, 1), class_A(:, 2), '*', 'Color', [0.00,0.45,0.74], 'MarkerSize', 10);
    plot(a3, class_B(:, 1), class_B(:, 2), 'x', 'Color', [0.85,0.33,0.10], 'MarkerSize', 10);
    title(a3, "Decision Boundary", "FontName", "Times New Roman");
    hold off;

    if bool_export_plots == true
        % pause;
        exportgraphics(a1, "prob10_adaline_weights.pdf", 'ContentType', 'vector');
        exportgraphics(a2, "prob10_adaline_biases.pdf", 'ContentType', 'vector');
        exportgraphics(a3, "prob10_adaline_decision_boundary.pdf", 'ContentType', 'vector');
    end
end