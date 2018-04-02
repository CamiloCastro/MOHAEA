function Y=ZDT1(X)
    Y (1,:)= X(1,:);  
    [n,data] = size(X); 
    g = 1 + (9*sum(X(2:end,:))./(n-1))  ;  
    Y (2,:)= g.*(1 - sqrt( X(1,:)./ g ));
end