function [Sol] = FNDS(P)
    S={};
    S{1}=[];
    Sol={};
    Sol{1}=[];
    for i=1:length(P)
        p(i).sol=P(:,i);
        p(i).num=i;
    end
    for i=1:length(P)        
        p(i).Np=0;
        p(i).Sp=[];
        for j=1:length(P)
            if (p(i).sol<p(j).sol)
                p(i).Sp=[p(i).Sp j];
            elseif(p(i).sol>p(j).sol)
                p(i).Np=p(i).Np+1;
            end            
        end
        if (p(i).Np==0)
            p(i).rank=1;
            S{1}=[S{1} p(i)];
            Sol{1}=[Sol{1} p(i).num];
        end
    end    
    
    i=1;
    
    while (~isempty(S{i}))
        Q=[];
        aux=[];
        S{i+1}=[];
        Sol{i+1}=[];
        for j=1:length(S{i})
            for k=1:length(S{i}(j).Sp)
                p(S{i}(j).Sp(k)).Np=p(S{i}(j).Sp(k)).Np-1;
                if(p(S{i}(j).Sp(k)).Np==0)
                    p(S{i}(j).Sp(k)).rank=i+1;
                    Q=[Q p(S{i}(j).Sp(k))];
                    aux=[aux p(S{i}(j).Sp(k)).num];
                end
            end
        end
        i=i+1;
        S{i}=Q;
        Sol{i}=aux;
    end
%      mensaje='Frente de pareto ';
%      for i=1:length(Sol)-1
%          mensaje1=strcat(mensaje,'-',int2str(i),':');
%          disp(mensaje1);        
%          disp(Sol{i});
%      end    
end