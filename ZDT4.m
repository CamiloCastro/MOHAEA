function Y=ZDT4(X)
    Y (1,:)= X(1,:);
    [n,data] = size(X);    
    g = 1 + 10*(n-1) + sum( X(2:end,:).^2 - 10*cos(4*pi*X(2:end,:)));    
    Y (2,:)= g.*(1 - sqrt( X(1,:)./ g ));
end