%Using AllGraphs idea by going over all possible graphs of size n, then
%adding a counter and counting each subgroup.
function [] = Motifs_in_Graph(mat, n)
    k = max(max(mat));
    graphs = [];
    length = 0;
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
            end
        end
    end
    motifs_counters = zeros(size(graphs,3),1);
    graph_mat = zeros(k,k);
    for i = 1:size(mat,1)
         graph_mat(mat(i,1),mat(i,2))=1;
    end
    C = nchoosek([1:k],n);
    for i=1:size(C,1)
        A = zeros(n,n);
        for j = 1:n
            for m = 1:n
               A(j,m)=graph_mat(C(i,j),C(i,m));
            end
        end
        if Check_Con(A) == 1
            for j = 1:size(graphs,3)
                if Is_Isomorphic(A,graphs(:,:,j))
                    motifs_counters(j) = motifs_counters(j) + 1;
                    break;
                end
            end
        end
    end
    for i = 1:size(graphs,3)
        disp("#"+i+ " count:"+ motifs_counters(i));
        Print_Graph(graphs(:,:,i));
    end
end

