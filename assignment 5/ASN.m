function solution = ASN(x)
%     x_4 = -3.5; x_3 = -2.5; x_2 = -1.5; x_1 = -0.5; 
%     x0 = 0.5;
%     x1 = 1.5; x2 = 2.5; x3 = 3.5; x4 = 4.5; x5 = 5.5;
%     
%     y_4 = 4241691; y_3 = 4290988; y_2 = 4349412; y_1 = 4410679;
%     y0 = 4465924;
%     y1 = 4499100; y2 = 4542600; y3 = 4582600; y4 = 4638400; y5 = 4683100;
%     
    A = [-3.5, -2.5, -1.5, -0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5];
    B = [4241691, 4290988, 4349412, 4410679, 4465924, 4499100, 4542600, 4582600, 4638400, 4683100];
    L = 1; l1 = 1; l2 = 1; P=0;
    for i = 1 : 10
        for j = 1:10
            if i ~= j
                l1 = l1 * ( x -A(j));
                l2 = l2 * (A(i) - A(j));
                L = l1 / l2;  
            end
        end
        
        P = L * B(i) +P;
        
    end
    solution = P;
    
%     for i = 2 : 9
%         a = P(i);
%         disp(a);
%     end
    
    