function [] = prob3(skip_cell, bool_export_plots)

    if nargin < 2
       bool_export_plots = false;
    end
    
    skip_init = false;
    skip_a = false;
    skip_b = false;
    skip_c = false;
    skip_d = false;

    for i = 1:length(skip_cell)
        if strcmpi(skip_cell{i}, "init") == 1
            skip_init = true;
        elseif strcmpi(skip_cell{i}, "a") == 1
            skip_a = true;
        elseif strcmpi(skip_cell{i}, "b") == 1
            skip_b = true;
        elseif strcmpi(skip_cell{i}, "c") == 1
            skip_c = true;
        elseif strcmpi(skip_cell{i}, "d") == 1
            skip_d = true;           
        end
    end

    a = 0.3;
    b = 0.4;

    % Initialize
    N_ITER = 200;

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
        xlabel(ax1, "Iteration");
        xlabel(ax2, "Iteration");
        ylabel(ax1, "X");
        ylabel(ax2, "X");
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
        fprintf('Finished init!\n')
        pause;
    end

    if skip_a == false
        a_size = 8;
        a = linspace(0, 1.4, a_size);
        b=0;
        f = tiledlayout(4,2);
        xlabel(f, "Iteration", "FontName", "Times New Roman");
        ylabel(f, "X", "FontName", "Times New Roman");
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
            fprintf('Exporting...\nPlease fix the figure to your desired size and press any key to continue...\n')
            pause;
            exportgraphics(f, "prob3_(a)_multiple_a_b_0.pdf", 'ContentType', 'vector');
        end
        fprintf('Finished A!\n')
        pause;
    end

    if skip_b == false
        % This question is to test sensitivity to initial conditions
        a = 0.3;
        x_init = [0 0.1 0.5 0.7 1];
        b = [0 0.1 0.32];

        ax = zeros(length(x_init), length(b));

        for i = 1:length(x_init)
            figure;
            f(i) = tiledlayout(3,1);
            xlabel(f, "Iteration", "FontName", "Times New Roman");
            for j = 1:length(b)
                ax(i,j) = nexttile;
                set(ax(i,j), "FontName", "Times New Roman");
                grid(ax(i,j), "on");
                ylabel(ax(i,j), "X");
                title(ax(i,j), sprintf("x_{init}=%0.2f, b=%0.2f", x_init(i), b(j)));
                hold(ax(i,j), "on");
                henon_map(a,b(j),x_init(i), N_ITER, ax(i,j));
                hold(ax(i,j), "off");
            end
        end

        if bool_export_plots == true
            fprintf('Exporting...\nPlease fix the figure to your desired size and press any key to continue...\n')
            pause;
            for i = 1:length(x_init)
                exportgraphics(f(i), sprintf("prob3_(b)_x_init_%0.2f.pdf", x_init(i)), 'ContentType', 'vector');
            end
        end
        fprintf('Finished B!\n')
        pause;
    end

    if skip_c == false
        a = 0.365;
        b = 0.3;

        N_ITER = 1.5e3;

        figure;
        ax = axes;
        set(ax, "FontName", "Times New Roman");
        hold(ax, "on");
        henon_map(a, b, 0, N_ITER, ax);
        hold(ax, "off");
        grid(ax, "on");
        xlabel(ax, "Iteration");
        ylabel(ax, "X");

        if bool_export_plots == true
            exportgraphics(ax, "prob3_(c)_a_0.365_b_0.3.pdf", 'ContentType', 'vector');
        end

        fprintf('Finished C!\n')
        pause;
    end

    if skip_d == false
        a = [0.2 0.5 0.9];
        b = [0.4 0.4 0.4];
        ax = zeros(length(a), 1);

        for i = 1:length(a)
            f(i) = figure;
            ax(i) = axes;
            set(ax(i), "FontName", "Times New Roman");
            hold(ax(i), "on");
            grid(ax(i), "on");
            xlabel(ax(i), "Iteration");
            ylabel(ax(i), "X");
            title(ax(i), sprintf("a=%0.2f, b=%0.2f", a(i), b(i)));
            henon_map(a(i), b(i), 0, N_ITER, ax(i));
            hold(ax(i), "off");
        end

        if bool_export_plots == true
            for i = 1:length(a)
                exportgraphics(f(i), sprintf("prob3_(d)_a_%0.2f_b_%0.2f.pdf", a(i), b(i)), 'ContentType', 'vector');
            end
        end
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