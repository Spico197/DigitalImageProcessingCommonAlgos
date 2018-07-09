function re = eightNeighborFilter(im)

[rows, cols] = size(im);
C = im;

for i = 2:rows-1
    for j = 2:cols-1
       C(i, j) = (sum(sum( C(i-1:i+1, j-1:j+1) )))/9;
    end
end

re = C;
end
