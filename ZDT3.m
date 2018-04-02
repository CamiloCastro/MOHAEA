function Y=ZDT3(X)
    Y (1,:)= X(1,:);  
    [n,data] = size(X); 
    g = 1 + (9*sum(X(2:end,:))./(n-1))  ;  
    Y (2,:)= g.*(1 - sqrt( X(1,:)./ g ) - ( X(1,:)./ g ).*sin(10*pi* X(1,:)) );
end