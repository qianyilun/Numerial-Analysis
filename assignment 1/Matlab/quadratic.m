function [p1, p2, x1,x2, ae1,ae2, re1,re2] = quadratic(a, b, c)
	
	round_a = fl(a);
	round_b = fl(b);
	round_c = fl(c);

    SquareRoot = sqrt(b^2 - 4* a * c);

    % rounding 4-digit SquareRoot
    round_SquareRoot = fl(sqrt(fl(fl(round_b * round_b) - fl(4 * fl(round_a * round_c)))));

    deno = 2 * a;

    % round deno
    round_deno = fl(2 * round_a);
    
    %p1 = first possibly
    %p2 = second possibly
    p1 = -b + SquareRoot;
    p2 = -b - SquareRoot;

    %round p1 & p2
    round_p1 = fl(-round_b + round_SquareRoot);
    round_p2 = fl(-round_b - round_SquareRoot);

    tolerance = 1e-5;

    % if NO cancellation error
    if p1 > tolerance && p2 > tolerance
        a1 = p1 / deno;
        a2 = p2 / deno;

        x1 = fl(round_p1 / round_deno);
 		x2 = fl(round_p2 / round_deno);

    % if cancellation error of p1
    elseif p1 < tolerance && p2 > tolerance
        a1 = (-2*c) / (b + SquareRoot);
        a2 = p2 /deno;

        x1 = fl((-2*round_c) / (round_b + round_SquareRoot));
        x2 = fl(round_p2 / round_deno);

    % if cancellarion error of p2
    elseif p2 < tolerance && p1 > tolerance
        a1 = p1 / deno;
        a2 = (-2*c) / (b - SquareRoot);

        x1 = fl(round_p1 / round_deno);
        x2 = fl((-2*round_c) / (round_b - round_SquareRoot));

    % if both cancellarion error of p1 & p2    
    else
        a1 = (-2*c) / (b + SquareRoot);
        a2 = (-2*c) / (b - SquareRoot);

        x1 = fl((-2*round_c) / (round_b + round_SquareRoot));
        x2 = fl((-2*round_c) / (round_b - round_SquareRoot));

    end 
    
 
    ae1 = abs(a1 - x1);
    ae2 = abs(a2 - x2);
    
    re1 = ae1 / abs(a1);
    re2 = ae2 / abs(a2);
