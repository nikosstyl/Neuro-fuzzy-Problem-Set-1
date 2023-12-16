function [] = prob3(skip_cell, bool_export_plots)

    if nargin < 2
       bool_export_plots = false;
    end
    
    skip_init = false;
    skip_a = false;
    skip_b = false;

    for i = 1:length(skip_cell)
        if strcmpi(skip_cell{i}, "init") == 1
            skip_init = true;
        elseif strcmpi(skip_cell{i}, "a") == 1
            skip_a = true;
        elseif strcmpi(skip_cell{i}, "b") == 1
            skip_b = true;            
        end
    end

    a = 0.3;
    b = 0.4;

    % Initialize
    N_ITER = 1e3;

    if skip_init == false
        figure(1);
        ax1 = axes;
        figure(2);
        ax2 = axes;
    
        hold(ax1, "on");
        hold(ax2, "on");
        set(ax1, "FontName", "Times New Roman");
        set(ax2, "FontName", "Times New Roman");
        grid(ax1, "on");
        grid(ax2, "on"); 
        xlabel(ax1, "X");
        xlabel(ax2, "X");
        ylabel(ax1, "Y");
        ylabel(ax2, "Y");
        henon_map(a,b,0, N_ITER, ax1);
        henon_map(a, b, 0.00001, N_ITER, ax2);
        hold(ax1, "off");
        hold(ax2, "off");
        title(ax1, "Henon Map with x_{init}=0");
        title(ax2, "Henon Map with x_{init}=10^{-5}");
        if bool_export_plots == true
            exportgraphics(ax1, "prob3_x_init_0.pdf", 'ContentType', 'vector');
            exportgraphics(ax2, "prob3_x_init_1e-5.pdf", 'ContentType', 'vector');
        end

        pause;
    end

    if skip_a == false
        a_size = 8;
        a = linspace(0, 1.4, a_size);
        b=0;
        f = tiledlayout(4,2);
        for i = 1:a_size % 2:N_ITER
            ax1 = nexttile;
            set(ax1, "FontName", "Times New Roman");
            grid(ax1, "on");
            title(ax1, sprintf("a=%0.2f", a(i)));
            hold(ax1, "on");
            henon_map(a(i),b,0, N_ITER, ax1);
            hold(ax1, "off");
        end

        if bool_export_plots == true
            pause;
            fprintf('Exporting...\nPlease fix the figure to your desired size and press any key to continue...\n')
            exportgraphics(f, "prob3_multiple_a_b_0.pdf", 'ContentType', 'vector');
        end
        pause;
    end

    if skip_b == false
        
    end
end


function [x] = henon_map (a,b,x_init, iters, ax)
    x = zeros(iters, 1);
    x(1,1) = x_init;

    for i = 2:iters
        x(i+1,1) = 1 - a*x(i,1)^2 + b*x(i-1,1);
        plot(ax, i, x(i,1), '*', 'Color', [0.00,0.45,0.74]);
    end
end