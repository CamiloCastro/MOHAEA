function pop = reward_pop(pop)

    for i=1:length(pop)
        init_probs = pop(i).geneticOps_prob;
        gop_pos = pop(i).selected_OP_index;
        delta = rand;
        if(pop(i).offspring_n == 0)
            init_probs(gop_pos) = (1.0 + delta)*init_probs(gop_pos);    
        else        
            init_probs(gop_pos) = (1.0 - delta)*init_probs(gop_pos);       
        end
    
        pop(i).geneticOps_prob = init_probs / sum(init_probs);
        
    end

    

end