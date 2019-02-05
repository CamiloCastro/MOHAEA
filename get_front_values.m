function Y=get_front_values(X, front)
    size_pop = length(X);
    Y=zeros(1, size_pop);
    for i=1:size_pop        
        for j=i+1:size_pop            
            if (X(:,j) == X(:,i))
                continue;
            end
            if (X(:,j) < X(:,i))
                Y(i) = Y(i) + 1.0;        
            elseif(X(:,j) > X(:,i))
                Y(j) = Y(j) + 1.0;
            end
        end        
    end
    Y = find(Y == front);

    


end