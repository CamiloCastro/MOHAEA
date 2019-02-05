function [pop, fronts]  = fitness_pop(pop,min)

    size_pop = length(pop);        
    
    for i=1:size_pop
        pop(i).fitness = 0.0;
    end
    
    max = 0;
    
    for i=1:size_pop        
        for j=i+1:size_pop            
            if (pop(j).fobj == pop(i).fobj)
                continue;
            end
            if (min)
                if (pop(j).fobj < pop(i).fobj)
                    pop(i).fitness = pop(i).fitness + 1.0;        
                elseif (pop(i).fobj < pop(j).fobj)
                    pop(j).fitness = pop(j).fitness + 1.0;
                end
            elseif(~min)
                if (pop(j).fobj > pop(i).fobj)
                    pop(i).fitness = pop(i).fitness + 1.0;        
                elseif (pop(i).fobj > pop(j).fobj)
                    pop(j).fitness = pop(j).fitness + 1.0;
                end
            end
        end
        if(pop(i).fitness > max)
            max = pop(i).fitness;
        end
    end
    
    fronts = cell(1, max + 1);        
    for i=1:size_pop        
        fronts{pop(i).fitness + 1} = [fronts{pop(i).fitness + 1} i];
    end

%     A = [];
%     for i=1:length(pop)
%         A = [A, pop(i).fobj];
%     end
%     fronts = FNDS(A);
    
end