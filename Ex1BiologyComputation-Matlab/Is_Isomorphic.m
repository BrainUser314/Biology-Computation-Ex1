%Checks if 2 given graphs are isomorphic or not, it is done by going over
%all possible pernutations and permuting a graph matrix by the formula 
%P^T M P where P is the matrix permutation, then comparing the two.
function bol = Is_Isomorphic(mat1,mat2)
    n = length(mat1(:,1));
    P = perms([1:n]);
    for i = 1:length(P(:,1))
        P_mat = eye(n);
        helper = eye(n);
        for j = 1:n
            P_mat(j,:) = helper(P(i,j),:);
        end
        mat = P_mat.'*mat1*P_mat;
        zero_mat = zeros(n,n);
        if mat - mat2 == zero_mat
            bol = 1;
            return;
        end
    end
    bol = 0;
end

