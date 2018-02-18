%Lancozs Algorithm to find Eigenvalue spectra
%Inputs :A matrix of the order n
%       :n order of the matrix
%Author:Jishnu Rajendran
%As a part of semester project
%


function [T,V,u] = Lanczos(A,n)

    T = zeros(n);       %Initailising the T matrix with all  
                        %All entries 0
    V = zeros(n,n);
   % if abs(norm(u)-1)<0.001
    %    w1=u;
    %else 
    w1 = rand(n,1);      %Generating Random vector of norm 1
    w1 = w1/norm(w1);    %
    u=w1;
    
    
    t = A*w1;
    alpha = w1'*t;
    t = t - w1*alpha;

    V(:,1) = w1;
    T(1,1) = alpha;

    for j = 2:n,

        beta = norm(t); 
        w0 = w1; w1 = t/beta;
        
        t = A*w1 - w0*beta;
        alpha = w1'*t;
        t = t - w1*alpha;

        T(j,j-1) = beta;
        T(j-1,j) = beta;
        T(j,j) = alpha;
        V(:,j)   = w1;
        [X,~]=eig(T);
        if(abs(X(j,n))<0.000001)
           break
        end
        
    end 
    
end
