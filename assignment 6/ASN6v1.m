function ASN6v1()
        %%%%%%%% curve 1 %%%%%%%%%%%%%%%%
        
	        x = [1, 2, 5, 6, 7, 8, 10, 13, 17];
	        a = [3.0, 3.7, 3.9, 4.2, 5.7, 6.6, 7.1, 6.7, 4.5];
	        FPO = 1.0;
	        FPN = -0.67;

	        n = 8;
	        N = n + 1;

	        h = zeros(1,N);
	        alpha = zeros(1, N);
	        l = zeros(1,N);
	        u = zeros(1,N);
	        c = zeros(1,N);

	        b = zeros(1,N);
	        d = zeros(1,N);

	        for i = 1 : n
	            h(i) = x(i + 1) - x(i);
	        end

	        alpha(1) = (3*(a(2) - a(1))/h(1)) - 3*FPO;
	        alpha(N) = 3*FPN - 3*(a(N)-a(N-1))/h(N-1);



	        for i = 2: n;
	            alpha(i) = ((3/h(i)) .* (a(i+1) - a(i))) - ((3/h(i-1)) .* (a(i)-a(i-1)));
	        end

	        l(1) = 2*h(1);
	        u(1) = 0.5;
	        z(1) = alpha(1) ./ l(1);

	        for i = 2 : n
	            l(i) = 2*(x(i+1) - x(i-1)) - h(i-1) .* u(i-1);
	            u(i) = h(i) / l(i);
	            z(i) = (alpha(i) - h(i-1) .* z(i-1)) / l(i); 
	        end

	        l(N) = h(N-1) .* (2 - u(N-1));
	        z(N) = (alpha(N) - h(N-1) .* z(N-1)) ./ l(N);
	        c(N) = z(N);

	        for j = n : -1 : 1
	            c(j) = z(j) - u(j) .* c(j+1);
	            b(j) = (a(j+1) - a(j))./h(j) - h(j) .* (c(j+1) + 2*c(j))/3;
	            d(j) = (c(j+1) - c(j)) ./ (3.*h(j));
	        end

% 	        for j = 1:n
% 	            disp('a is: ' );
% 	            disp(a(j));
% 	            disp('b is: ' );
% 	            disp(b(j));
% 	            disp('c is: ' );
% 	            disp(c(j));
% 	            disp('d is: ' );
% 	            disp(d(j));
% 	            disp('*************');
% 	        end

	        %for j = 1:n
	        	for i = 1:17
		        	if i <= 2

		        		j = 1;

						y = 1:0.02:2;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 2;

					elseif i > 2 && i <= 5

						j = 2;

						y = 2:0.02:5;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z，'b');
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 5;

	                elseif i > 5 && i <= 6

	                	j = 3;

	                	y = 5:0.02:6;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 6;

	                elseif i > 6 && i <= 7

	                	j = 4;

	                	y = 6:0.02:7;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 7;

	                elseif i > 7 && i <= 8

	                	j = 5;

	                	y = 7:0.02:8;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 8;

	                elseif i > 8 && i <= 10

	                	j = 6;

	                	y = 8:0.02:10;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 10;

	                elseif i > 10 && i <= 13

	                	j = 7;

	                	y = 10:0.02:13;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 13;

	                elseif i > 13 && i <= 17

	                	j = 8;

	                	y = 13:0.02:17;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 17;

	                end
	            end
	                
	                

            %end

                

        %%%%%%%% curve 2 %%%%%%%%%%%%%%%%
        
	        x = [17, 20, 23, 24, 25, 27, 27.7];
	        a = [4.5, 7.0, 6.1, 5.6, 5.8, 5.2, 4.1];
	        FPO = 3.0;
	        FPN = -4.0;

	        n = 6;
	        N = n + 1;

	        h = zeros(1,N);
	        alpha = zeros(1, N);
	        l = zeros(1,N);
	        u = zeros(1,N);
	        c = zeros(1,N);

	        b = zeros(1,N);
	        d = zeros(1,N);

	        for i = 1 : n
	            h(i) = x(i + 1) - x(i);
	        end

	        alpha(1) = (3*(a(2) - a(1))/h(1)) - 3*FPO;
	        alpha(N) = 3*FPN - 3*(a(N)-a(N-1))/h(N-1);



	        for i = 2: n;
	            alpha(i) = ((3/h(i)) .* (a(i+1) - a(i))) - ((3/h(i-1)) .* (a(i)-a(i-1)));
	        end

	        l(1) = 2*h(1);
	        u(1) = 0.5;
	        z(1) = alpha(1) ./ l(1);

	        for i = 2 : n
	            l(i) = 2*(x(i+1) - x(i-1)) - h(i-1) .* u(i-1);
	            u(i) = h(i) / l(i);
	            z(i) = (alpha(i) - h(i-1) .* z(i-1)) / l(i); 
	        end

	        l(N) = h(N-1) .* (2 - u(N-1));
	        z(N) = (alpha(N) - h(N-1) .* z(N-1)) ./ l(N);
	        c(N) = z(N);

	        for j = n : -1 : 1
	            c(j) = z(j) - u(j) .* c(j+1);
	            b(j) = (a(j+1) - a(j))./h(j) - h(j) .* (c(j+1) + 2*c(j))/3;
	            d(j) = (c(j+1) - c(j)) ./ (3.*h(j));
	        end

% 	        for j = 1:n
% 	            disp('a is: ' );
% 	            disp(a(j));
% 	            disp('b is: ' );
% 	            disp(b(j));
% 	            disp('c is: ' );
% 	            disp(c(j));
% 	            disp('d is: ' );
% 	            disp(d(j));
% 	            disp('*************');
% 	        end

	        for i = 17:28
		        	if i <= 20

		        		j = 1;

						y = 17:0.02:20;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 20;

					elseif i > 20 && i <= 23

						j = 2;

						y = 20:0.02:23;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 23;

	                elseif i > 23 && i <= 24

	                	j = 3;

	                	y = 23:0.02:24;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 24;

	                elseif i > 24 && i <= 25

	                	j = 4;

	                	y = 24:0.02:25;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 25;

	                elseif i > 25 && i < 27

	                	j = 5;

	                	y = 25:0.02:27;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 26;

	                elseif i >= 27 && i <= 27.7

	                	j = 6;

	                	y = 27:0.02:27.7;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 28;

	                end
	            end

        %%%%%%%% curve 3 %%%%%%%%%%%%%%%%
	    
	        x = [27.7, 28, 29, 30];
	        a = [4.1, 4.3, 4.1, 3.0];
	        FPO = 0.33;
	        FPN = -1.5;

	        n = 3;
	        N = n + 1;

	        h = zeros(1,N);
	        alpha = zeros(1, N);
	        l = zeros(1,N);
	        u = zeros(1,N);
	        c = zeros(1,N);

	        b = zeros(1,N);
	        d = zeros(1,N);

	        for i = 1 : n
	            h(i) = x(i + 1) - x(i);
	        end

	        alpha(1) = (3*(a(2) - a(1))/h(1)) - 3*FPO;
	        alpha(N) = 3*FPN - 3*(a(N)-a(N-1))/h(N-1);



	        for i = 2: n;
	            alpha(i) = ((3/h(i)) .* (a(i+1) - a(i))) - ((3/h(i-1)) .* (a(i)-a(i-1)));
	        end

	        l(1) = 2*h(1);
	        u(1) = 0.5;
	        z(1) = alpha(1) ./ l(1);

	        for i = 2 : n
	            l(i) = 2*(x(i+1) - x(i-1)) - h(i-1) .* u(i-1);
	            u(i) = h(i) / l(i);
	            z(i) = (alpha(i) - h(i-1) .* z(i-1)) / l(i); 
	        end

	        l(N) = h(N-1) .* (2 - u(N-1));
	        z(N) = (alpha(N) - h(N-1) .* z(N-1)) ./ l(N);
	        c(N) = z(N);

	        for j = n : -1 : 1
	            c(j) = z(j) - u(j) .* c(j+1);
	            b(j) = (a(j+1) - a(j))./h(j) - h(j) .* (c(j+1) + 2*c(j))/3;
	            d(j) = (c(j+1) - c(j)) ./ (3.*h(j));
	        end

	        for i = 27.7:30
		        	if i <= 28

		        		j = 1;

						y = 27.7:0.02:28;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 28;

					elseif i > 28 && i <= 29

						j = 2;

						y = 28:0.02:29;
						z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 29;

	                elseif i > 29 && i <= 30

	                	j = 3;

	                	y = 29:0.02:30;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 30;

	                elseif i > 24 && i <= 25

	                	j = 4;

	                	y = 24:0.02:25;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 25;

	                elseif i > 25 && i <= 27

	                	j = 5;

	                	y = 25:0.02:27;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 27;

	                elseif i > 27 && i <= 27.7

	                	j = 6;

	                	y = 27:0.02:27.7;
	                	z = a(j) +b(j).*(y - x(j))+c(j).*((y - x(j)).^2) +d(j).*((y - x(j)).^3); 
		                plot (y,z);
		                semilogy(y,z);
		                grid on;
		                hold on;

		                i = 27.7;
		            end
		        end


% 	        for j = 1:n
% 	            disp('a is: ' );
% 	            disp(a(j));
% 	            disp('b is: ' );
% 	            disp(b(j));
% 	            disp('c is: ' );
% 	            disp(c(j));
% 	            disp('d is: ' );
% 	            disp(d(j));
% 	            disp('*************');
%                 
% 	        end
 
    
                


    %reference:
    % Clamped Cubic Spline: 
    % RICHARD L. BURDEN, DOUGLAS J. FAIRES, ANNETTE M. BURDEN, (2014)
    % NUMERICAL ANALYSIS TENTH EDITION
    % page 152-153, ALGORITHM 3.5






