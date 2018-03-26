%genetic_ops : Array with function handlers that defines genetic operators
%objectives : Function that defines the objectives
%N : Population size
%iterations : Total of iterations of the algorithm
%SS: Matrix with the min and max value of each dimension. The size must be
%(dx2) where d is the dimension of the problem

function pop = SPHAEA(genetic_ops, objectives, N, iterations, SS, min)
    SS_size = size(SS);    
    dimensions = SS_size(1);
    n_geneticOps = length(genetic_ops);    
    
    pop(N).var = 0;
    pop(N).fobj = 0;
    pop(N).fitness = 0;
    pop(N).geneticOps_prob = 0;
    
    
    %Random initialization    
    for i=1:N
        pop(i).var = rand(dimensions,1);
        pop(i).var = ((SS(:,2) - SS(:,1)) .* pop(i).var) + SS(:,1);
        pop(i).fobj = objectives(pop(i).var);        
    end
    
    for i=1:N
        pop(i).fitness = fitness(pop,pop(i),min);
        pop(i).geneticOps_prob = (1/n_geneticOps) * ones(n_geneticOps,1);
    end
    
    new_pop(N).var = 0;
    new_pop(N).fobj = 0;
    new_pop(N).fitness = 0;
    new_pop(N).geneticOps_prob = 0;
    
    for i=1:iterations
        for j=1:N
            selected_OP_index = custom_random_selection(pop(j).geneticOps_prob);
            selected_OP = genetic_ops{selected_OP_index};   
            new_ind = selected_OP(pop, j, SS);
            best_ind = pop(j);
            best_pos = 0;
            for k=1:length(new_ind)
                new_ind(k).fobj = objectives(new_ind(k).var);
                new_ind(k).fitness = fitness(pop,new_ind(k),min);
                if (new_ind(k).fitness <= best_ind.fitness)
                    best_ind = new_ind(k);
                    best_pos = k;
                end
            end
            if (best_pos == 0)
                new_pop(j) = pop(j);
                init_prob = new_pop(j).geneticOps_prob(selected_OP_index);
                new_pop(j).geneticOps_prob(selected_OP_index) = abs(init_prob - rand);
                new_pop(j).geneticOps_prob = new_pop(j).geneticOps_prob / sum(new_pop(j).geneticOps_prob);                
            elseif (new_ind(best_pos).fitness == pop(j).fitness);
                new_ind(best_pos).geneticOps_prob = pop(j).geneticOps_prob;
                new_pop(j) = new_ind(best_pos);
                init_prob = new_pop(j).geneticOps_prob(selected_OP_index);
                new_pop(j).geneticOps_prob(selected_OP_index) = abs(init_prob - rand);
                new_pop(j).geneticOps_prob = new_pop(j).geneticOps_prob / sum(new_pop(j).geneticOps_prob);
            else
                new_ind(best_pos).geneticOps_prob = pop(j).geneticOps_prob;
                new_pop(j) = new_ind(best_pos);
                init_prob = new_pop(j).geneticOps_prob(selected_OP_index);
                new_pop(j).geneticOps_prob(selected_OP_index) = init_prob + rand;
                new_pop(j).geneticOps_prob = new_pop(j).geneticOps_prob / sum(new_pop(j).geneticOps_prob);
            end
        end
        pop = new_pop;
        for k=1:N
            pop(k).fitness = fitness(pop,pop(k),min);        
        end
    end
end