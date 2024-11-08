function [A,B, f] = plot_functions (creat_pdf_bool)

    if nargin == 0
        creat_pdf_bool = false;
    end

    size = 1000;
    tol = 1e-2;
    x = linspace(-5, 12, size);
    A = zeros(1, size);
    B = A;

    i2 = find_num(x, 2, tol);
    i5 = find_num(x, 5, tol);
    i3 = find_num(x, 3, tol);
    i7 = find_num(x, 7, tol);

    % fprintf('i2 = %d\t x(i2) = %f\n', i2, x(i2))
    % fprintf('i5 = %d\t x(i5) = %f\n', i5, x(i5))
    % fprintf('i3 = %d\t x(i3) = %f\n', i3, x(i3))
    % fprintf('i7 = %d\t x(i2) = %f\n', i7, x(i7))

    A(1,1:i2) = 1;
    A(1,i2:i5) = 1 - (x(i2:i5)-2)/3;
    A(1, i5:size) = 0;

    B(1, 1:i3) = 0;
    B(1, i3:i7) = (x(i3:i7)-3)/4;
    B(1, i7:size) = 1;

    figure(1);
    plot(x, A, x, B, "LinEwidth", 1.2);
    axis tight;
    grid on;
    xlabel('X');
    ylabel('Y');
    legend('A(x)', 'B(x)');
    set(gca, "FontName", "Times New Roman");
    if creat_pdf_bool == true
        exportgraphics(gca, 'a_b_functions.pdf', 'ContentType', 'vector');
    end

    a_b_midpoint = 29/7;
    i_a_b_midpoint = find_num(x, a_b_midpoint, tol);
    
    f = zeros(1, size);

    f(1, 1:i2) = 0;
    f(1, i2:i_a_b_midpoint) = (x(1, i2:i_a_b_midpoint)-2) / 3;
    f(1, i_a_b_midpoint:i7) = 1 - (x(1, i_a_b_midpoint:i7)-3)/4;
    f(1, i7:size) = 0;

    figure(2);
    plot(x, f, "LineWidth", 1.2, 'Color', "#77AC30");
    axis tight;
    grid on;
    xlabel('X');
    ylabel('Y');
    xline(a_b_midpoint);
    legend('not(A(x) OR B(x))');
    set(gca, "FontName", "Times New Roman");
    if creat_pdf_bool == true
        exportgraphics(gca, 'expression_plot.pdf', 'ContentType', 'vector');
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