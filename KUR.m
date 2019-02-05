function Y=KUR(X)
    
    Y (1,:)= sum(-10*exp(-0.2*sqrt(X(1:2,:).^2 + X(2:3,:).^2)));
    Y (2,:)= sum(abs(X).^0.8 + 5*sin(X.^3));

end