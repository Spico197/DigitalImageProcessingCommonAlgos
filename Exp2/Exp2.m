%% Exp2
close all
clear, clc

%% Q1
im = imread('../data/jingjing.jpg');
% im = imread('peppers.png');
imGray = rgb2gray(im);

imGrayHistMat = imageHist(imGray);

figure
subplot(1,2,1)
imshow(imGray)
title('Original Image')
subplot(1,2,2)
bar(imGrayHistMat)
axis([0, 255, 0, inf])
title('Gray Histogram')

%% Q2
[imEql, relation, imAccumulation] = imageEql(imGray);

figure

subplot(2,2,1)
imshow(imGray)
title('Original Image')
subplot(2,2,2)
bar(imGrayHistMat)
axis([0, 255, 0, inf])
title('Gray Histogram')

subplot(2,2,3)
imshow(imEql)
title('Image after imEql')
subplot(2,2,4)
bar(imageHist(imEql))
axis([0 255 0 inf])
title('Gray Histogram after imEql')

%% Q3
figure

subplot(1,2,1)
bar(imGrayHistMat)
axis([0, 255, 0, inf])
title('Gray Histogram By imageHist')

subplot(1,2,2)
imhist(imGray)
axis([0 255 0 inf])
title('Gray Histogram By Inner Function')

%% Q4
figure
subplot(2,2,1)
imshow(imEql)
title('Image after imEql')

subplot(2,2,2)
bar(imageHist(imEql))
axis([0, 255, 0, inf])
title('Gray Histogram Equalization By imEql')

subplot(2,2,3)
imshow(histeq(imGray))
title('Image after histeq')

subplot(2,2,4)
imeql = histeq(imGray);
bar(imageHist(imeql));
axis([0 255 0 inf])
title('Gray Histogram Equalization By Inner Function')

%% Q5
imWithGaussianNoise = imnoise(imGray, 'gaussian', 0, 0.05);
imFilterGaussianNoise = eightNeighborFilter(imWithGaussianNoise);

figure
subplot(1,2,1)
imshow(imWithGaussianNoise)
title('Image with Gaussian Noise')
subplot(1,2,2)
imshow(imFilterGaussianNoise)
title('Image after Eight-neighbor Filter')

figure
subplot(1,2,1)
imshow(imWithGaussianNoise)
title('Image with Gaussian Noise')
subplot(1,2,2)
imshow(medium(imGray))
title('Image after Median Filter')

%% Q6
[rows, cols] = size(imGray);
c = zeros(rows, cols);
imDouble = im2double(imGray);

for row = 2:rows-1
    for col = 2:cols-1
        c(row,col) = 4*imDouble(row, col) - imDouble(row-1, col) - imDouble(row+1, col) - imDouble(row, col-1) - imDouble(row, col+1);
    end;
end;

figure
subplot(1,2,1)
imshow(imGray)
title('Original Image')
subplot(1,2,2)
imshow(imDouble-c)
title('Image after Laplace Operator')

figure
subplot(1,2,1)
imshow(imGray)
title('Original Image')
subplot(1,2,2)
w = fspecial('laplacian', 0);
g1 = imfilter(imDouble, w, 'replicate');
imshow(imDouble-g1)
title('Image after imfilter')
