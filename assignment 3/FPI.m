function [p, msg, cov] = FPI(p0)
    
    n = input('Enter a number: ');
    TOL = 1e-20;
    max_N = 50;
    
    for i = 1:(max_N)
        switch n
            case 1
                p = (20*p0 + 21/(p0^2)) / 21;
                %pn1 = (20*p + 21/(p^2)) / 21;
            
            case 2
                p = (p0) - (((p0^3)-21) / (3*(p0^2)));
                %pn1 = (p) - (((p^3)-21) / (3*(p^2)));
               
            case 3
                p = (p0) - (((p0^4)-21*p0) / (p0^2 - 21));
                %pn1 = (p) - (((p^4)-21*p) / (p^2 - 21));
                
            case 4
                p = (21 / p0)^(1/2);
                %pn1 = (21 / p)^(1/2);
        end
        %disp(i);
        %y = abs(pn1 - p);
        
        error = abs(p - p0);
        %disp(error);
        %disp(p);
        
        
        %quad_cov = y/(error^2);
        if error >= TOL
            p0 = p;
        end
    end
    
    in = input('Enter a number: ');
        switch in
            case 1
                msg = 'lin: ';
                cov = abs(1/21 * (20 - 42/(p^3)));
                
            case 2
                msg = 'quad: ';
                cov = abs(42/(p^4));
           
                
            case 4
                msg = 'lin: ';
                cov = abs(-1/2 * sqrt(21) * (p^(-3/2)));
        
        end
        
        %reference:
    %Crout Factorization Algrithom: 
    % RICHARD L. BURDEN, DOUGLAS J. FAIRES, ANNETTE M. BURDEN, (2014)
    % NUMERICAL ANALYSIS TENTH EDITION
    % page59, ALGORITHM 2.2
    
    
   