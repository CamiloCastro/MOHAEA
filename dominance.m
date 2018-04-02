function alpha =  dominance(A,B, min)
    alpha = -1;
    if(A==B)
        return;
    end
    if(min)
        if (A<B)
            alpha = 1;
        elseif (B<A)
            alpha = 2;
        end
    else
        if (A>B)
            alpha = 1;
        elseif (B>A)
            alpha = 2;
        end
    end
end