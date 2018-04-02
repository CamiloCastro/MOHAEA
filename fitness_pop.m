function pop = fitness_pop(pop,min)
    size_pop = length(pop);
    k = floor(sqrt(size_pop));
    distance_matrix = zeros(size_pop, size_pop);
    
    for i=1:size_pop
        pop(i).fitness = 0.0;
    end
    
    for i=1:size_pop        
        for j=i+1:size_pop
            distance_matrix(i,j) = pdist([pop(j).fobj';pop(i).fobj']);
            distance_matrix(j,i) = pdist([pop(j).fobj';pop(i).fobj']);
            if (pop(j).fobj == pop(i).fobj)
                continue;
            end
            if (min)
                if (pop(j).fobj <= pop(i).fobj)
                    pop(i).fitness = pop(i).fitness + 1.0;        
                elseif (pop(i).fobj <= pop(j).fobj)
                    pop(j).fitness = pop(j).fitness + 1.0;
                end
            elseif(~min)
                if (pop(j).fobj >= pop(i).fobj)
                    pop(i).fitness = pop(i).fitness + 1.0;        
                elseif (pop(i).fobj >= pop(j).fobj)
                    pop(j).fitness = pop(j).fitness + 1.0;
                end
            end
        end
        dist_vector =  distance_matrix(i, 1:k);
        [M,I] = max(dist_vector);
        for j=k+1:size_pop
            if (distance_matrix(i, j) < M)
                dist_vector(I) = distance_matrix(i, j);
                [M,I] = max(dist_vector);
            end
        end
        density = 1/(2 + max(dist_vector));
        pop(i).fitness = pop(i).fitness + density;
    end
end