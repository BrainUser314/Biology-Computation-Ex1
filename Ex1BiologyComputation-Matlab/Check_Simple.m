%Checks whether or not a given graph is simple
function bol = Check_Simple(mat)
    bol = 0;
    for i = 1:length(mat(1,:))
        bol = bol || mat(i,i) == 1;
    end
    bol = 1 - bol;
end

