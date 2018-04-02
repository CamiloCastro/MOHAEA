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
    
    for i=1:d        
        alpha = rand;
%         alpha1 = rand;
        new_ind(1).var(i) = alpha*ind.var(i) + (1-alpha)*best_ind.var(i);        
        new_ind(2).var(i) = (1-alpha)*ind.var(i) + alpha*best_ind.var(i);        
    end
end