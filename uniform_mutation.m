function new_ind = uniform_mutation(pop, i, SS)
    ind = pop(i);
    d = length(ind.var);
    new_ind.var = zeros(d,1);
    new_ind.fobj = 0;
    new_ind.fitness = 0;
    new_ind.geneticOps_prob = 0;    
    
    for i=1:d        
        new_ind.var(i) = (SS(i,2) - SS(i,1))*rand + SS(i,1);        
    end
    
end