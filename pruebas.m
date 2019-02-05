% x1=linspace( 0, 1 );
% xi=zeros(29, 100);
% 
% X=[x1;xi];
% 
% Y = ZDT3(X);
% 
% plot(Y(1,:), Y(2,:))

% A = [];
% for i=1:length(pop)
%     A = [A, pop(i).fobj];
% end
% Sol = FNDS(A)


 SS = [0 2];
 obj=@SCH;
 X=linspace(0,2);
 Y = obj(X);
 l = length(Y);
 plot(Y(1,:),Y(2,:), 'k')
 i = 1;
 P = zeros(2,100);
 while i <= 100
     pos = true;
     prob = 4*rand(2,1);
     for j = 1:100
         if Y(:,j) > prob
             pos = false;
         end
     end
     if pos
        P(:,i) = prob;
        i = i + 1;         
     end
 end 
 hold on
 plot(P(1,:), P(2,:), '*b')