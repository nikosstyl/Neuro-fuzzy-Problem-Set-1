function [] = prob9_optimal_decision_boundary(bool_export_plots)
    
    
if nargin == 0
    bool_export_plots = false;
end

% Define the targets and inputs
t = [-1, 1];
z = [[1;2], [-2;1]];


% Create a color map
colors = ['r', 'b', 'g']; % red for t=-1, blue for t=1

% Plot the points
hold on; % allows multiple plots on the same figure
grid on;
for i = 1:length(t)
    if t(i) == -1
        scatter(z(1,i), z(2,i), colors(1), '*'); % red color for t=-1
    else
        scatter(z(1,i), z(2,i), colors(2), 'x'); % blue color for t=1
    end
end

x = linspace(-10,10,100);
y = x;

%Optimal decision boundary
F = -0.6*x-0.2*y;

plot(x,F,LineWidth=1.2)
title('Optimal Decision Boundary function');
legend("Pattern 1","Pattern2");
%Add title to axis
xlabel("x'axis");
ylabel("y-axis");

set(gca,"FontName","Times New Roman")

hold off;

if bool_export_plots == true
    exportgraphics(gca, 'patterns.pdf', 'ContentType', 'vector');
end

end
    