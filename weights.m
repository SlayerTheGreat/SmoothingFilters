function [ I ] = weights( n )
    I = ones(n)*((n-1)^2);
    mid = ceil(n/2);
    for i=1:n
        for j=1:n
            I(i,j) = exp(-((i-mid)^2/2+(j-mid)^2/2));
        end
    end
%     sum(sum(I))
%     surf(1:n,1:n,I);
end

