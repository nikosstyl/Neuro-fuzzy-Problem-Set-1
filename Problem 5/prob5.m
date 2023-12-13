function [] = prob5(activation_function, bool_export_plots)

    if nargin == 1
        bool_export_plots = false;
    elseif nargin == 0
        error('Activation function not defined!')
    end

    p = linspace(-2, 2, 200);
    
    w1_1_1 = -2;
    w1_2_1 = -1;
    w2_1_1 = 2;
    w2_1_2 = 1;
    b1_1 = -0.5;
    b1_2 = -0.75;
    b2 = 0.5;

    n1_1 = w1_1_1 * p + b1_1;
    n1_2 = w1_2_1 * p + b1_2;
   
    if strcmp(activation_function, 'logsig') == 1
        fprintf('LogSig used!\n')
        a1_1 = m_logsig(n1_1);
        a1_2 = m_logsig(n1_2);
    elseif strcmp(activation_function, 'swish') == 1
        fprintf('Swish used!\n')
        a1_1 = m_swish(n1_1);
        a1_2 = m_swish(n1_2);
    end

    % Activation function here is purelin
    n2 = a1_1 * w2_1_1 + a1_2 * w2_1_2 + b2;

    figure;
    plot(p, a1_1, p, a1_2, p, n2, "LineWidth", 1.2);
    legend('a^1_1', 'a^1_2', 'a_2');
    xlabel('p');
    grid on;
    axis tight;

    if strcmp(activation_function, 'logsig') == 1
        title('LogSig response');
    elseif strcmp(activation_function, 'swish') == 1
        title('Swish response');
    end
    set(gca, "FontName", "Times New Roman")

    if (bool_export_plots == true)
        if (strcmp(activation_function, 'logsig') == 1)
            exportgraphics(gca, "logsig_activation.pdf", "ContentType","vector");
        elseif (strcmp(activation_function, 'swish') == 1)
            exportgraphics(gca, "swish_activation.pdf", "ContentType","vector");
        end
    end
end

function [out] = m_logsig(x)
    out = 1 ./ (1 + exp(-x));
end

function [out] = m_swish(x)
    out = x./(1+exp(-x));
end
