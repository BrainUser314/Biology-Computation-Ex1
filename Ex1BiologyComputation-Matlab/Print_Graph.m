%Prints a given graph according to the needed format
function [] = Print_Graph(mat)
    n = length(mat(1,:));
    for i = 1:n
        for j = 1:n
            if mat(i,j) == 1
                disp(i+" "+j);
            end
        end
    end
end

