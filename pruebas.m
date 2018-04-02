x1=linspace( 0, 1 );
xi=zeros(29, 100);

X=[x1;xi];

Y = ZDT3(X);

plot(Y(1,:), Y(2,:))

% A = [];
% for i=1:length(pop)
%     A = [A, pop(i).fobj];
% end
% Sol = FNDS(A)