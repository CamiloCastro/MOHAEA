function new_ind = power_law_mutation(pop, i, SS)
    ind = pop(i);
    d = length(ind.var);
    new_ind.var = zeros(d,1);
    new_ind.fobj = 0;
    new_ind.fitness = 0;
    new_ind.geneticOps_prob = 0;    
    sigma = 0.1;
    for i=1:d    
        x = rand;
        newVal = sigma*((1.0/(1.0 - x)) - 1.0);
        if(rand > 0.5)
            new_ind.var(i) = newVal + ind.var(i);
        else
            new_ind.var(i) = -newVal + ind.var(i);
        end        
        
        if(new_ind.var(i) > SS(i,2))
            new_ind.var(i) = SS(i,2);
        end
        if(new_ind.var(i) < SS(i,1))
            new_ind.var(i) = SS(i,1);
        end
    end
    
end