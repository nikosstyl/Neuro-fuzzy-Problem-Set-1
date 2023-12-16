function [] = prob9_plot_contour(bool_export_plots)

    if nargin ~= 1
        bool_export_plots = false;
    end

    x = linspace(-10, 15);
    y=x;

    [X,Y] = meshgrid(x,y);

    %probability,target value and pattern of input vector p1
    p1 = 0.5;
    t1 = [-1];
    z1 = [1;2];
    

    %probability,target value and pattern of input vector p2
    p2 = 0.5;
    t2 = [1];
    z2 = [-2;1];
    
    %Step1:Compute c,R,h

    %c = E[t^2]
    c = p1*t1^2+p2*t2^2

    %h = E[tz]
    h = p1*t1*z1+p2*t2*z2

    %R = E[z*z']
    R = z1*z1'*p1+z2*z2'*p2

    %x* = inv(R)*h
    xopt = inv(R)*h
    
    %F = c - 2*x'*h + x'*x*R
    F = 1 - 3.*X -Y +2.5*X.^2+2.5*Y.^2;

    %Sketch the 2D contour plot of F
    figure(1);
    contour(X,Y,F, 50);
    title('2D Contour plot');
    grid on;
    colorbar;

    set(gca, "FontName", "Times New Roman");
    if bool_export_plots == true
        exportgraphics(gca, "contour_2d.pdf", "ContentType", "vector")
    end
    
    %Sketch the 3D contour plot of F
    figure(2);
    contour3(X,Y,F, 40);
    title('3D Contour plot');
    grid on;
    colorbar;

    set(gca, "FontName", "Times New Roman");
    if bool_export_plots == true
        exportgraphics(gca, "contour_3d.pdf", "ContentType", "vector")
    end
    figure(1);
   
end