function new_ind = arithmetic_crossover(pop, i, SS)

    ind = pop(i);
    d = length(ind.var);
    
    new_ind(1).var = zeros(d,1);
    new_ind(1).fobj = 0;
    new_ind(1).fitness = 0;
    new_ind(1).geneticOps_prob = 0;
    
    new_ind(2).var = zeros(d,1);
    new_ind(2).fobj = 0;
    new_ind(2).fitness = 0;
    new_ind(2).geneticOps_prob = 0;
    

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
    
    alpha = rand;
    alpha_1 = rand;
    neg_alpha = 1.0 - alpha;
    neg_alpha_1 = 1.0 - alpha_1;
    
    
    for i=1:d                
        new_ind(1).var(i) = alpha*ind.var(i) + neg_alpha*best_ind.var(i);        
        new_ind(2).var(i) = alpha_1*ind.var(i) + neg_alpha_1*best_ind.var(i);        
    end
end