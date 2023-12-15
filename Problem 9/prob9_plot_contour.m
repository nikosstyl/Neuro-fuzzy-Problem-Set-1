function [] = prob9_plot_contour(bool_export_plots)

    if nargin ~= 1
        bool_export_plots = false;
    end

    x = linspace(-20, 30);
    y=x;

    [X,Y] = meshgrid(x,y);

    F = 676 - 176.8.*X - 124.8.*Y + 12.4.*X.^2 + 15.2.*X.*Y + 6.4.*Y.^2;
    figure(1);
    contour(X,Y,F, 50);
    grid on;
    colorbar;
    set(gca, "FontName", "Times New Roman");
    if bool_export_plots == true
        exportgraphics(gca, "contour_2d.pdf", "ContentType", "vector")
    end

    figure(2);
    contour3(X,Y,F, 40);
    grid on;
    colorbar;
    set(gca, "FontName", "Times New Roman");
    if bool_export_plots == true
        exportgraphics(gca, "contour_3d.pdf", "ContentType", "vector")
    end
end