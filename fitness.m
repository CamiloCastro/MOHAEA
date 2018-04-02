function result = fitness(pop,ind,min)
    size_pop = length(pop);    
    k = ceil(sqrt(size_pop));
    dist_vector = inf*ones(k, 1);
    result = 0.0;    
    for i=1:size_pop
        distance = pdist([ind.fobj';pop(i).fobj']);        
        [M,I] = max(dist_vector);
        if (distance < M)
            dist_vector(I) = distance;
        end        
        if(dominance(pop(i).fobj, ind.fobj, min) == 1)
            result = result + 1.0; 
        end
    end

    density = 1/(2 + max(dist_vector));    
    result = result + density;
    if (result == 0.0)
        disp('fitness0')
    end
end