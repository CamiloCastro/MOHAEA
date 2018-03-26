SS = [-1000 1000];
GOP = {@mutation @cross};
obj = @SCH;
min = true;
n_iterations = 1000;
pop_size = 100;


pop = SPHAEA(GOP, obj, pop_size, n_iterations, SS, true);

X = 0:0.1:2;
Y = SCH(X);

plot(Y(1,:),Y(2,:))
hold on;
for i=1:length(pop)
    if (pop(i).fitness == 0)
        plot(pop(i).fobj(1),pop(i).fobj(2),'*');
    end
end