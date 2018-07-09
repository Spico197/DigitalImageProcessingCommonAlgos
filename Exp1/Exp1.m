%% initialization
close all
clear, clc

%% Q1
im = imread('..\data\jingjing.jpg');
% convert to gray image with a 256 degree
imGray = uint8(rgb2gray(im));

figure(1)
subplot(1, 2, 1)
imshow(im)
title('Original Image')
subplot(1, 2, 2)
imshow(imGray)
title('256 Degree Gray Image')

%% Q2
imWithGaussianNoise = imnoise(imGray, 'gaussian', 0, 0.2);
imWithSaltPepperNoise = imnoise(imGray, 'salt & pepper', 0.2);

imFilterGaussianNoise = eightNeighborFilter(imWithGaussianNoise);
imFilterSaltPepperNoise = eightNeighborFilter(imWithSaltPepperNoise);

figure(2)

subplot(3, 2, 1:2)
imshow(imGray)
title('Original Image')

subplot(3, 2, 3)
imshow(imWithGaussianNoise)
title('Gaussian Noise Mean:0 Var:0.2')
subplot(3, 2, 4)
imshow(imFilterGaussianNoise)
title('After Filter')

subplot(3, 2, 5)
imshow(imWithSaltPepperNoise)
title('Salt & Pepper Noise d:0.2')
subplot(3, 2, 6)
imshow(imFilterSaltPepperNoise)
title('After Filter')

%% Q3
mat = zeros(50, 50);
mat(20, 10:15) = 255;

figure(3)
subplot(4,2,1)
imshow(mat)
title('Original Image')
subplot(4,2,2)
matFFT = abs(fft2(mat));
% matFFT = 10.*log(matFFT);
matFFT = mat2gray(fftshift(matFFT));
imshow(matFFT)
title('After FFT')

mat = zeros(50, 50);
mat(20, 35:40) = 255;
subplot(4,2,3)
imshow(mat)
title('Original Image')

subplot(4,2,4)
matFFT = abs(fft2(mat));
% matFFT = 10.*log(matFFT);
matFFT = mat2gray(fftshift(matFFT));
imshow(matFFT)
title('After FFT')

mat = zeros(50, 50);
mat(10, 10:15) = 255;
subplot(4,2,5)
imshow(mat)
title('Original Image')

subplot(4,2,6)
matFFT = abs(fft2(mat));
% matFFT = 10.*log(matFFT);
matFFT = mat2gray(fftshift(matFFT));
imshow(matFFT)
title('After FFT')

mat = zeros(50, 50);
mat(10:15, 10) = 255;
subplot(4,2,7)
imshow(mat)
title('Original Image')

subplot(4,2,8)
matFFT = abs(fft2(mat));
% matFFT = 10.*log(matFFT);
matFFT = mat2gray(fftshift(matFFT));
imshow(matFFT)
title('After FFT')

%% Q4

imDct = dct2(imGray);
figure(4)
subplot(1,3,1)
imshow(imGray)
title('Gray Image')
subplot(1,3,2)
imshow(log(abs(imDct)), [])
colormap(gca,jet(64))
title('After DCT')
colorbar
subplot(1,3,3)
imRe = imDct;
imRe(abs(imRe) < 0.01) = 0;
imshow(idct2(imRe), [0, 255])
title('Re-construction')
