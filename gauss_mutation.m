function new_ind = gauss_mutation(pop, i, SS)
    ind = pop(i);
    d = length(ind.var);
    new_ind.var = zeros(d,1);
    new_ind.fobj = 0;
    new_ind.fitness = 0;
    new_ind.geneticOps_prob = 0;    
    
    for i=1:d    
        sigma = 0.001;
        new_ind.var(i) = ind.var(i) + sigma*normrnd(0,1);
        if(new_ind.var(i) > SS(i,2))
            new_ind.var(i) = SS(i,2);
        end
        if(new_ind.var(i) < SS(i,1))
            new_ind.var(i) = SS(i,1);
        end
    end
    
end