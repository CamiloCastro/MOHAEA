%genetic_ops : Array with function handlers that defines genetic operators
%objectives : Function that defines the objectives
%N : Population size
%iterations : Total of iterations of the algorithm
%SS: Matrix with the min and max value of each dimension. The size must be
%(dx2) where d is the dimension of the problem
%min: true if all objective functions are going to be minimized, to
%maximize use false

function pop = MOHAEA(genetic_ops, objectives, N, iterations, SS, min, Y)
    SS_size = size(SS);    
    dimensions = SS_size(1);
    n_objective = SS_size(2);
    n_geneticOps = length(genetic_ops);    
    
    pop(N).var = 0;
    pop(N).fobj = 0;
    pop(N).fitness = 0;
    pop(N).geneticOps_prob = 0;    
    
    %Initialization    
    for i=1:N
        pop(i).var = rand(dimensions,1);
        pop(i).var = ((SS(:,2) - SS(:,1)) .* pop(i).var) + SS(:,1);
        pop(i).fobj = objectives(pop(i).var);  
        pop(i).geneticOps_prob = (1/n_geneticOps) * ones(n_geneticOps,1);
    end    
    
    [pop, fronts] = fitness_pop(pop, min);    
    
    new_pop(N).var = 0;
    new_pop(N).fobj = 0;
    new_pop(N).fitness = 0;
    new_pop(N).geneticOps_prob = 0;
    new_pop(N).offspring_n = 0;
    new_pop(N).offspring_init = 0;
    new_pop(N).selected_OP_index = -1;
    
    figure(1)    
    plot(Y(1,:),Y(2,:))
    hold on;
    for i=1:length(pop)        
        plot(pop(i).fobj(1),pop(i).fobj(2),'*r');           
    end
    drawnow
    pause(0.1)
    
    for i=1:iterations
        disp(['Iteration ', num2str(i)]);
        total_offsprings = [];
        for j=1:N
            selected_OP_index = custom_random_selection(pop(j).geneticOps_prob);
            selected_OP = genetic_ops{selected_OP_index};   
            offspring = selected_OP(pop, j, SS);
            for k=1:length(offspring)
                offspring(k).fobj = objectives(offspring(k).var);
                offspring(k).geneticOps_prob = pop(j).geneticOps_prob;
                offspring(k).selected_OP_index = selected_OP_index;
                offspring(k).offspring_n = 0;   
                offspring(k).offspring_init = 0;                   
            end
            pop(j).offspring_n = length(offspring);
            pop(j).selected_OP_index = selected_OP_index;
            pop(j).offspring_init = length(total_offsprings);
            total_offsprings = [total_offsprings offspring];
%             new_pop(j).geneticOps_prob = reward(new_pop(j).geneticOps_prob, isBest, selected_OP_index);

        end
        all_pop = [pop total_offsprings];
        [all_pop, fronts] = fitness_pop(all_pop, min);
        pop = replacement_pop(all_pop, n_objective, N, fronts);
        pop = reward_pop(pop);        
        
%         for j=1:N
%             parent = all_pop(j);
%             offspring = all_pop(N+1+parent.offspring_init : N+1+parent.offspring_init + pop(j).offspring_n - 1);
%             [best_ind, isBest] = replacement(parent, offspring);
%             new_pop(j) = best_ind;
%             new_pop(j).geneticOps_prob = reward(new_pop(j).geneticOps_prob, isBest, new_pop(j).selected_OP_index);            
%         end
        
%         pop = new_pop;   
        hold off;
        plot(Y(1,:),Y(2,:))
        hold on;
        for j=1:length(pop)        
            plot(pop(j).fobj(1),pop(j).fobj(2),'*r');           
        end
        drawnow
        pause(0.1)
        
    end
end