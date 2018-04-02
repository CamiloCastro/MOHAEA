function Y=FON(X)
    [n,data] = size(X);
    k = 1/sqrt(n);
    Y (1,:)= 1 - exp(-sum( (X - k).^2 ));
    Y (2,:)= 1 - exp(-sum( (X + k).^2 ));
end