function new_probs = reward(init_probs, isBest, gop_pos)

    delta = rand;
    if(isBest == 0 || isBest == 1)
        init_probs(gop_pos) = (1.0 - delta)*init_probs(gop_pos);    
    elseif(isBest == 2)        
        init_probs(gop_pos) = (1.0 + delta)*init_probs(gop_pos);       
    end
    
    new_probs = init_probs / sum(init_probs);

end