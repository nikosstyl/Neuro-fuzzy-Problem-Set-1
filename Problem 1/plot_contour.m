function [Z] = plot_contour(start_num, end_num)

    x = linspace(start_num, end_num, 100);
    y = x;
    [X, Y] = meshgrid(x, y);
    Z = X.^2 + 4*X.*Y + Y.^2;
    figure(1);
    contour3(X, Y, Z, 50);
    set(gca, "FontName", "Linux Libertine O");
    figure(2);
    contour(X, Y, Z, 50);
    set(gca, "FontName", "Linux Libertine O");
    xlabel('X');
    ylabel('Y');

end