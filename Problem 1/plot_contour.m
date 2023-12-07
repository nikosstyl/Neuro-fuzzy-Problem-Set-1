function [Z] = plot_contour(start_num, end_num)

    x = linspace(start_num, end_num, 100);
    y = x;
    [X, Y] = meshgrid(x, y);
    Z = X.^2 + 4*x.*Y + Y.^2;
    contour(X, Y, Z, 40);
    xlabel('X');
    ylabel('Y');
    % heatmap(Z);

end