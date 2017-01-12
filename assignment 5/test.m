function solution = test(x)
%     x_4 = -3.5; x_3 = -2.5; x_2 = -1.5; x_1 = -0.5; 
%     x0 = 0.5;
%     x1 = 1.5; x2 = 2.5; x3 = 3.5; x4 = 4.5; x5 = 5.5;
%     
%     y_4 = 4241691; y_3 = 4290988; y_2 = 4349412; y_1 = 4410679;
%     y0 = 4465924;
%     y1 = 4499100; y2 = 4542600; y3 = 4582600; y4 = 4638400; y5 = 4683100;
%     
    A = [2, 2.2, 2.3];
    B = [0.6931, 0.7885, 0.8329];
    P = 0;
    
    for i = 1 : 3
        L = 1; l1 = 1; l2 = 1; 
        for j = 1:3
            if i ~= j
                l1 = l1 * ( x - A(j));
                l2 = l2 * (A(i) - A(j));
                L = l1 / l2;  
            end
        end
        disp('l1 is: ');
        disp(l1);
        disp('l2 is: ');
        disp(l2);
        disp('***L is: ');
        disp(L);
        
        P = L * B(i) + P;
        disp('****P is: ');
        disp(P);
        
    end
    solution = P;
    
%     for i = 2 : 9
%         a = P(i);
%         disp(a);
%     end
    
    