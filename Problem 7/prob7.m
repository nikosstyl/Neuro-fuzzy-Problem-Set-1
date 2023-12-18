function [] = prob7(skip_cell, bool_export_plots)

    if nargin < 1
        skip_cell = {};
    end
    if nargin < 2
       bool_export_plots = false;
    end
    
    skip_a = false;
    skip_b = false;
    skip_c = false;
    skip_d = false;

    for i = 1:length(skip_cell)
        if strcmpi(skip_cell{i}, "a") == 1
            skip_a = true;
        elseif strcmpi(skip_cell{i}, "b") == 1
            skip_b = true;
        elseif strcmpi(skip_cell{i}, "c") == 1
            skip_c = true;
        elseif strcmpi(skip_cell{i}, "d") == 1
            skip_d = true;           
        end
    end

    x = linspace(-10, 10, 1000);

    k = 1;
    e = exp(1);
    m = e;
    L = 2*e;

    f = zeros(1, size(x,2));

    if skip_a == false
        y = x./(1 + exp(-x));
        f = calc_f(x, k, L, m);
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
        fprintf('Finished A!\n')
    end

    if skip_b == false
        k=0;
        L = 2*exp(1);
        m = exp(1);

        y = 1./(1 + exp(-x));
        f = calc_f(x, k, L, m);
        figure;
        plot(x, y, x, f, LineWidth = 1.2);
        grid on;
        xlabel('X');
        ylabel('Y');
        xline(0, "LineWidth", 1);
        yline(0, "LineWidth", 1);
        legend('Sigmoid', 'Approximation');
        if bool_export_plots == true
            exportgraphics(gca, 'prob7_sigmoid.pdf', 'ContentType','vector');
        end
        fprintf('Finished B!\n')
    end
    
    if skip_c == false
        k = 1;
        m = 0;
        L = 0;

        y = zeros(1, size(x,2));

        i_0 = find_num(x, 0, 0.02);
        y(i_0:size(y,2)) = x(i_0:size(y,2));
        f = calc_f(x, k, L, m);

        figure;
        plot(x, y, x, f, LineWidth = 1.2);
        grid on;
        xlabel('X');
        ylabel('Y');
        xline(0, "LineWidth", 1);
        yline(0, "LineWidth", 1);
        legend('ReLU', 'Approximation');
        
        if bool_export_plots == true
            exportgraphics(gca, 'prob7_relu.pdf', 'ContentType','vector');
        end
        fprintf('Finished C!\n')
    end
end

function [f] = calc_f(x, k, L, m)
    i_L_p = find_num(x, L, 0.02);
    i_L_n = find_num(x, -L, 0.02);
    f(1:i_L_n) = 0;
    f(i_L_n:i_L_p) = x(i_L_n:i_L_p).^k .* ((L+x(i_L_n:i_L_p)).^m)./((L+x(i_L_n:i_L_p)).^m + (L-x(i_L_n:i_L_p)).^m);
    f(i_L_p:size(x,2)) = x(i_L_p:size(x,2)).^k;
end

function [i] = find_num (x, num_to_find, tolerance)
    for i=1:size(x,2)
        if abs(x(1,i) - num_to_find) <= tolerance
            return;
        end
    end
    i = -1;
end