% Define the targets and inputs
t = [-1, 1];
z = [[1;2], [-2;1]];

% Initial weights
w = [3 1];

% Learning rate
lr = 0.025;

% Number of iterations
N = 100;

% Preallocate arrays for weights and error
W = zeros(N*length(t), length(w));

% LMS algorithm
k = 1;
for n = 1:N
    for i = 1:length(t)
        % Compute output
        y = w * z(:,i);
        
        % Compute error
        error = t(i) - y;
        
        % Update weights
        w = w + lr * error * z(:,i)';
        
        % Store weights
        W(k, :) = w;
        
        k = k + 1;
    end
end

% Create the contour plot using your function F
figure;
prob9_plot_contour(true); 
hold on;

% Overlay the trajectory of the weights
plot(W(:, 1), W(:, 2), 'r-', 'LineWidth', 2);

xlabel('w1');
ylabel('w2');
title('Trajectory of the LMS algorithm');
hold off;