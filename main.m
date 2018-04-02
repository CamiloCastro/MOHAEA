clear;

%SCH Parameters
% SS = [-1000 1000];
% obj=@SCH;
% X=linspace(0,2);

%FON Parameters
% SS = repmat([-4 4],3,1);
% obj = @FON;
% xi = linspace(-1/sqrt(3), 1/sqrt(3));
% X=[xi;xi;xi];

%ZDT1 Parameters
SS = repmat([0 1],30,1);
obj = @ZDT1;
x1=linspace( 0, 1 );
xi=zeros(29, 100);
X=[x1;xi];

%ZDT3 Parameters
% SS = repmat([0 1],30,1);
% obj = @ZDT3;
% x1=linspace( 0, 1 );
% xi=zeros(29, 100);
% X=[x1;xi];


GOP = {@uniform_mutation @arithmetic_crossover};
min = true;
n_iterations = 250;
pop_size = 200;

tic
pop = SPHAEA(GOP, obj, pop_size, n_iterations, SS, true);
toc


Y = obj(X);
A = [];
for i=1:length(pop)
    A = [A, pop(i).fobj];
end
Sol = FNDS(A);
solutions = Sol{1};
plot(Y(1,:),Y(2,:))
hold on;
for i=1:length(solutions)        
    plot(pop(solutions(i)).fobj(1),pop(solutions(i)).fobj(2),'*r');           
end
