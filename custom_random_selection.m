function index = custom_random_selection(distribution)
    n = length(distribution);  
    acumm = 0.0;
    r = rand;
    for index=1:n
        before = acumm;
        acumm = acumm + distribution(index);
        if (r > before && r < acumm)            
            return;
        end
    end
end