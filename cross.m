function new_ind = cross(pop, i, SS)

    ind = pop(i);
    d = length(ind.var);
    new_ind.var = zeros(d,1);
    new_ind.fobj = 0;
    new_ind.fitness = 0;
    new_ind.geneticOps_prob = 0;

    N = length(pop);
    selected = randperm(N,4);
    best_ind = pop(selected(1));
    best_fitness = pop(selected(1)).fitness;
    for i=2:4
        if (pop(selected(i)).fitness < best_fitness)
           best_fitness = pop(selected(i)).fitness;
           best_ind = pop(selected(i));
        end
    end
    
    for i=1:d        
        new_ind.var(i) = (ind.var(i) + best_ind.var(i)) / 2;        
        if (new_ind.var(i) < SS(i,1))
            new_ind.var(i) = SS(i,1);
        elseif (new_ind.var(i) > SS(i,2))
            new_ind.var(i) = SS(i,2);
        end
    end
end