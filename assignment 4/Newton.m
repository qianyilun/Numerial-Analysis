function [p0] = Newton
    
    n = input('Enter a number: ');
    TOL = 1e-5;
    max_N = 30;
    
    %syms x;
    %f1 = symfun(1 - 4*x*cos(x) + 2*(x^2) +cos(2*x), x);
    %diff(f1,x);
    switch n
        case 1
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            f = @(x) 1 - 4*x*cos(x) + 2*(x^2) +cos(2*x);
            df = @(x) 4*x - 2*sin(2*x) - 4*cos(x) + 4*x*sin(x);
            p0 = 0.5;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 2
            
            f = @(x) x^2 + 6 * (x^5) + 9 * (x^4) - 2 * (x^3) - 6 * (x^2) + 1;
            df = @(x) 30*x^4 + 36*x^3 - 6*x^2 - 10*x;
            p0 = -3;
            
        case 3
            f = @(x) sin(3*x) + 3 *exp(-2 *x)*sin(x) - 3*exp(-x) * sin(2*x) - exp(-3*x);
            df = @(x) 3*cos(3*x) + 3*exp(-3*x) + 3*exp(-2*x)*cos(x) - 6*exp(-2*x)*sin(x) - 6*cos(2*x)*exp(-x) + 3*sin(2*x)*exp(-x);
            p0 = 3;
            
        case 4
            f = @(x) exp(3*x) - 27*(x^6) + 27*(x^4)*exp(x) - 9*(x^2)*exp(2*x);
            df = @(x) 3*exp(3*x) - 18*x*exp(2*x) + 108*x^3*exp(x) + 27*x^4*exp(x) - 18*x^2*exp(2*x) - 162*x^5;
            p0 = 3;
    end
    
    p00 = p0;
    
    for i = 1:max_N
        p = p0 - f(p0)/df(p0);
        
        error = abs(p - p0);
        %disp(error);
        if error >= TOL
            p0 = p;
        end
    end
    
    solution = p;
    
    for i = 1:max_N
        p = p00 - f(p00)/df(p00);
        
        true_error = abs(p - solution);
        disp(true_error);
        if true_error >= TOL
            p00 = p;
        end
    end
      