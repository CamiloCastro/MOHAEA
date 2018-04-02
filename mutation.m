function new_ind = mutation(pop, i, SS)
    ind = pop(i);
    d = length(ind.var);
    new_ind.var = zeros(d,1);
    new_ind.fobj = 0;
    new_ind.fitness = 0;
    new_ind.geneticOps_prob = 0;
    
    for i=1:d
        if(rand > 0.5)
%             mu = (SS(i,2) + SS(i,1))/2;
%             sigma = (SS(i,2) - SS(i,1))/6;
            new_ind.var(i) = ind.var(i) + normrnd(0,0.2);
            if (new_ind.var(i) < SS(i,1))
                new_ind.var(i) = SS(i,1);
            elseif (new_ind.var(i) > SS(i,2))
                new_ind.var(i) = SS(i,2);
            end
        else
            new_ind.var(i) = ind.var(i);
        end
    end
end