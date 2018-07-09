function [imEql, relation, imAccumulation] = imageEql(imGray)

imEql = imGray;

% accumulation gray histogram
imGrayHistMat = imageHist(imGray);
imGrayHistMat = imGrayHistMat ./ length(imGray(:));

imAccumulation = cumsum(imGrayHistMat);

% figure()
% bar(imAccumulation)
% relation = floor((length(imGrayHistMat)-1).*imAccumulation + 0.5);

relation = floor( (length(imGrayHistMat)-1) .*imAccumulation + 0.5);

for cnt = 1:256
    imEql(imGray== cnt-1) = relation(cnt);
end

end