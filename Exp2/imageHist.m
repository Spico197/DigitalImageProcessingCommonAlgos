function imGrayHistMat = imageHist(imGray)

imGrayHistMat = zeros(1, 256);

for degree = 0:255
    imGrayHistMat(degree+1) = length(find(imGray == degree));
end

end