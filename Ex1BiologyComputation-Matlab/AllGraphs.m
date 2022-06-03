%Prints all bi-connected digraphs of size n
%We go over all graphs, 2^(n^2) graphs, then we check connectivity and
%simplicity, then we check if we arrived to a known one and save it and
%print if needed.
function [] = AllGraphs(n)
    graphs = [];
    length = 0;
    disp("n="+n);
    for i=0:2^(n^2)-1
        A=zeros(n,n);
        a=zeros(1,n^2);
        b= de2bi(i);
        b(end+1:numel(a))=0;
        for j=1:n
            A(j,:)= b(1+(j-1)*n:j*n);
        end
        
        
        if Check_Con(A) == 1 && Check_Simple(A) == 1
            bol = 0;
            for j=1:length
                bol = bol || Is_Isomorphic(graphs(:,:,j),A);
            end
            if bol == 0
                length = length + 1;
                graphs = cat(3,graphs,A);
                disp("#"+length);
                Print_Graph(A);
            end
        end
    end
end
