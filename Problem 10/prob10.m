function [] = prob10(bool_export_plots)

    if nargin == 0
        bool_export_plots = false;
    end

    x1 = [0 0 1 -1];
    y1 = [0 1 0 -1];
    x2 = [2.1 0 1.6];
    y2 = [0 -2.5 -1.6];

    figure;
    plot(x1,y1,'*',x2,y2,'x', 'MarkerSize', 10);
    grid on;
    axis equal;
    set(gca, "FontName", "Times New Roman");
    xlabel('X');
    ylabel('Y');
    legend('Class A', 'Class B');

    if bool_export_plots == true
        exportgraphics(gca, 'patterns.pdf', 'ContentType', 'vector');
    end

end