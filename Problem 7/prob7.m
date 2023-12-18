function [] = prob7(bool_export_plots)

    if nargin < 1
        bool_export_plots = false;
    end

    x = linspace(-10, 10, 1000);
    y = x./(1 + exp(-x));

    k = 1;
    e = exp(1);
    m = e;
    L = 2*e;

    f = zeros(1, size(x,2));

    i_L_p = find_num(x, L, 0.01);
    i_L_n = find_num(x, -L, 0.01);
    f(1:i_L_n) = 0;
    f(i_L_n:i_L_p) = x(i_L_n:i_L_p).^k .* ((L+x(i_L_n:i_L_p)).^m)./((L+x(i_L_n:i_L_p)).^m + (L-x(i_L_n:i_L_p)).^m);
    f(i_L_p:size(x,2)) = x(i_L_p:size(x,2)).^k;

    figure;
    plot(x,y,x, f, LineWidth = 1.2);
    grid on;
    xlabel('X');
    ylabel('Y');
    xline(0, "LineWidth", 1);
    yline(0, "LineWidth", 1);
    legend('Swish', 'Approximation');

    if bool_export_plots == true
        exportgraphics(gca, 'prob7_swish.pdf', 'ContentType','vector');
    end
end

function [i] = find_num (x, num_to_find, tolerance)
    for i=1:size(x,2)
        if abs(x(1,i) - num_to_find) < tolerance
            return;
        end
    end
    i = -1;
end