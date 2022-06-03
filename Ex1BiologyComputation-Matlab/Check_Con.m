%Checks if a given unidirected graph is bi-directed(directions are not
%important). Done by going over all neighbours and continueing and stop
%when not possible, then comparing if we went over all vertices or not.
function con = Check_Con(mat)
    n = length(mat(1,:));
    for i = 1:n
        for j = 1:n
            mat(i,j)=(mat(i,j)||mat(j,i));
        end
    end 
    checkers = zeros(1,n);
    set = [1];
    counter = 1;    
    checkers(1)= 1;
    while length(set) > 0
        vertex = set(1);
        for i = 1:n
            if checkers(i) == 0 && mat(vertex,i)==1
                checkers(i)= 1;
                set = cat(2,set,[i]);             
                counter = counter + 1;
            end
        end     
        set = set(2:length(set));
    end
    con = (counter == n);
end

