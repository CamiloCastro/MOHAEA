function [best_ind, isBest] = replacement(pop, pos_parent, offspring, min)
    
    %Verify dominance
    new_pop = [pop(pos_parent) offspring];  
    A=[];
    for i=1:length(new_pop)
        A = [A, new_pop(i).fobj];
    end
    Sol = FNDS(A);
    best_indexes = Sol{1};       
    if(length(best_indexes) == 1)
        best_ind = new_pop(best_indexes);
        isBest = 2;
        if(best_ind.var == pop(pos_parent).var)
            isBest = 1;
        end
        return;
    end
    
    pop_verify = [pop(pos_parent) offspring];
    
    %Verify fitness
    new_pop = [pop offspring];
    best_indexes = 1;
    best_fitness = fitness(new_pop, pop_verify(1), min);
    for i = 2: length(pop_verify)
        fit = fitness(new_pop, pop_verify(i), min);
        if((min && fit<best_fitness) || (~min && fit>best_fitness))
            best_indexes = i;
            best_fitness = fit;
        elseif(fit == best_fitness)
            best_indexes = [best_indexes, i];
        end
    end
    if(length(best_indexes) == 1)
        best_ind = pop_verify(best_indexes);
        isBest = 2;
        if(best_ind.var == pop(pos_parent).var)
            isBest = 1;
        end
        return;
    else
        pop_verify = pop_verify(best_indexes);
        if(best_indexes(1)==1)
            isBest = 0;
            best_ind = pop_verify(randi([2 length(pop_verify)]));
            return;
        else
            isBest = 2;
            best_ind = pop_verify(randi([1 length(pop_verify)]));
        end
    end
%     pop_verify = pop_verify(best_indexes);
    
    %Verify diversity
%     new_pop = [pop offspring];
%     global_distance = 0.0;
%     best_indexes = [];
%     for i=1:length(pop_verify)
%         min_distance = inf;
%         for j=1:length(new_pop)
%             d = pdist([pop_verify(i).fobj';new_pop(j).fobj']);
%             if(d < min_distance)
%                 min_distance = d;
%             end
%         end
%         if(min_distance > global_distance)
%             global_distance = min_distance;
%             best_indexes = i;
%         elseif(min_distance == global_distance)
%             best_indexes = [best_indexes, i];
%         end
%     end
%     
%     if(length(best_indexes) == 1)
%         best_ind = pop_verify(best_indexes);
%         isBest = 2;
%         if(best_ind.var == pop(pos_parent).var)
%             isBest = 1;
%         end
%         return;
%     else
%         pop_verify = pop_verify(best_indexes);
%         if(best_indexes(1)==1)
%             isBest = 0;
%             best_ind = pop_verify(randi([2 length(pop_verify)]));
%             return;
%         else
%             isBest = 2;
%             best_ind = pop_verify(randi([1 length(pop_verify)]));
%         end
%     end
    
end