function pop = replacement_pop(all_pop, n_objective, pop_size, fronts)
    
    sum = 0;
    cases = 1;
    n = 0;
    for i=1:length(fronts)
        sum = sum + length(fronts{i});
        if(sum == pop_size)
            cases = 1;
            n = i;
            break;
        end
        if(sum > pop_size)            
            cases = 2;    
            n = i;
            break;
        end
    end
    
    pop = [];
    for i=1:n - 1
        pop = [pop all_pop(fronts{i})];
    end
    
    if(cases == 1)
        pop = [pop all_pop(fronts{n})];
    end
    if(cases == 2)
        
        A = [fronts{n};zeros(1,length(fronts{n}));all_pop(fronts{n}).fobj];       
        for i=1:n_objective
            A = (sortrows(A',i+2))';
            A(2,1) = inf;
            A(2,length(fronts{n})) = inf;
            for j=2:length(fronts{n})-1
                A(2,j) = A(2,j) + (A(i+2,j+1) - A(i+2,j-1));
            end
        end    
        A = (sortrows(A',-2))';        
        sum = sum - length(fronts{n});
        pop = [pop all_pop(A(1,1:(pop_size - sum)))];
        
    end
    
    

end