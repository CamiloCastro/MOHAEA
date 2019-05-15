% clear;

%SCH Parameters
% SS = [0 2];
% obj=@SCH;
% X=linspace(0,2);
% Y = obj(X);

%FON Parameters
% SS = repmat([-4 4],3,1);
% obj = @FON;
% xi = linspace(-1/sqrt(3), 1/sqrt(3));
% X=[xi;xi;xi];
% Y = obj(X);

%POL Parameters
% SS = [-pi pi;-pi pi];
% obj = @POL;
% load('POL.mat');


%KUR Parameters
% SS = [-5 5;-5 5;-5 5];
% obj = @KUR;
% ndata = 150;
% x1 = linspace(-5,5,ndata);
% x2 = linspace(-5,5,ndata);
% X = [];
% for i=1:length(x1)
%     for j=1:length(x2)
%         X =[X [x1(i)*ones(1,length(x1));x2(j)*ones(1,length(x2));linspace(-5,5,ndata)]];
%     end
% end
% Y = obj(X);
% load('KUR.mat');




%ZDT1 Parameters
% SS = repmat([0 1],29,1);
% SS = [0 1; SS];
% obj = @ZDT1;
% x1=linspace( 0, 1 );
% xi=zeros(29, 100);
% X=[x1;xi];
% Y = obj(X);

%ZDT3 Parameters
SS = repmat([0 1],30,1);
obj = @ZDT3;
x1=linspace( 0, 1 );
xi=zeros(29, 100);
X=[x1;xi];
Y = obj(X);

%ZDT4 Parameters
% SS = repmat([0 0.1],9,1);
% SS = [0 1; SS];
% obj = @ZDT4;
% x1=linspace( 0, 1 );
% xi=zeros(9, 100);
% X=[x1;xi];
% Y = obj(X);


GOP = {@power_law_mutation @arithmetic_crossover};
min = true;
n_iterations = 1000;
pop_size = 100;

% tic
pop = MOHAEA(GOP, obj, pop_size, n_iterations, SS, true, Y);
% toc




SolY = get_front_values(Y, 0);
Y=Y(:,SolY);
Y = (sortrows(Y',1))';
plot( Y(1,:),Y(2,:))
% hold on;
% for i=1:length(pop)        
%     plot(pop(i).fobj(1),pop(i).fobj(2),'*r');           
% end



% A = [];
% for i=1:length(pop)
%     A = [A, pop(i).fobj];
% end
% Sol = FNDS(A);
% solutions = Sol{1};
% 
% hold on;
% for i=1:length(solutions)        
%     plot(pop(solutions(i)).fobj(1),pop(solutions(i)).fobj(2),'*r');           
% end


