function result = fitness(pop,ind,min)

    result = 0.0;
    for i=1:length(pop)        
        if (ind.fobj == pop(i).fobj)
            continue;
        end
        if (min)
            if (pop(i).fobj <= ind.fobj)
                result = result + 1.0;        
            end
        elseif(~min)
            if (pop(i).fobj >= ind.fobj)
                result = result + 1.0;       
            end
        end
    end
end