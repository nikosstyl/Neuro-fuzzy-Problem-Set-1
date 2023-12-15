function [] = problem8_fun(bool_export_plots)

if nargin == 0
    bool_export_plots = false;
end

% Define the targets and inputs
t = [26, 26, -26];
z = [[2;4], [4;2], [-2;-2]];


% Create a color map
colors = ['r', 'b', 'g']; % red for t=26, blue for t=-26

% Plot the points
hold on; % allows multiple plots on the same figure
grid on;
for i = 1:length(t)
    if t(i) == 26
        scatter(z(1,i), z(2,i), colors(1), '*'); % red color for t=26
    else
        scatter(z(1,i), z(2,i), colors(2), 'x'); % green color for t=-26
    end
end
x = linspace(-10,10,100);
y = x;

F = 4.2370*x+4.7185*y;

plot(x,F,LineWidth=1.2)

%Add title to axis
xlabel("x'axis");
ylabel("y-axis");



set(gca,"FontName","Times New Roman")


hold off;

if bool_export_plots == true
    exportgraphics(gca, 'patterns.pdf', 'ContentType', 'vector');
end

end