%% 
close all
clear, clc
im = imread('../data/jingjing.jpg');
% im = imread('peppers.png');
imGray = rgb2gray(im);
imNoise = imnoise(imGray,'salt & pepper',0.02);

%% Ideal Low Pass Filter
d1 = 100;
imIdeal1 = idealLowPassFilter(imNoise, d1);
d2 = 60;
imIdeal2 = idealLowPassFilter(imNoise, d2);
d3 = 10;
imIdeal3 = idealLowPassFilter(imNoise, d3);

figure
subplot(2,2,1)
imshow(imNoise)
title('Noisy Image')
subplot(2,2,2)
imshow(abs(imIdeal1), [])
title(sprintf('Image After Ideal Low-Pass Filter %f', d1))
subplot(2,2,3)
imshow(abs(imIdeal2), [])
title(sprintf('Image After Ideal Low-Pass Filter %f', d2))
subplot(2,2,4)
imshow(abs(imIdeal3), [])
title(sprintf('Image After Ideal Low-Pass Filter %f', d3))

%% Butterworth Low-Pass Filter
d1 = 100;
imButter1 = butterWorthLowPass(imNoise, d1, 5);
d2 = 60;
imButter2 = butterWorthLowPass(imNoise, d2, 5);
d3 = 10;
imButter3 = butterWorthLowPass(imNoise, d3, 5);

figure
subplot(2,2,1)
imshow(imNoise)
title('Noisy Image')
subplot(2,2,2)
imshow(abs(imButter1), [])
title(sprintf('Image After Butterworth Low-Pass Filter %f', d1))
subplot(2,2,3)
imshow(abs(imButter2), [])
title(sprintf('Image After Butterworth Low-Pass Filter %f', d2))
subplot(2,2,4)
imshow(abs(imButter3), [])
title(sprintf('Image After Butterworth Low-Pass Filter %f', d3))

%% Ideal High Pass Filter
d1 = 150;
imIdeal1 = idealHighPassFilter(imNoise, d1);
d2 = 30;
imIdeal2 = idealHighPassFilter(imNoise, d2);
d3 = 5;
imIdeal3 = idealHighPassFilter(imNoise, d3);

figure
subplot(2,2,1)
imshow(imNoise)
title('Noisy Image')
subplot(2,2,2)
imshow(abs(imIdeal1), [])
title(sprintf('Image After Ideal High-Pass Filter %f', d1))
subplot(2,2,3)
imshow(abs(imIdeal2), [])
title(sprintf('Image After Ideal High-Pass Filter %f', d2))
subplot(2,2,4)
imshow(abs(imIdeal3), [])
title(sprintf('Image After Ideal Highs-Pass Filter %f', d3))

%% Butterworth High-Pass Filter
d1 = 100;
imButter1 = butterWorthHighPass(imNoise, d1, 5);
d2 = 60;
imButter2 = butterWorthHighPass(imNoise, d2, 5);
d3 = 10;
imButter3 = butterWorthHighPass(imNoise, d3, 5);

figure
subplot(2,2,1)
imshow(imNoise)
title('Noisy Image')
subplot(2,2,2)
imshow(abs(imButter1), [])
title(sprintf('Image After Butterworth High-Pass Filter %f', d1))
subplot(2,2,3)
imshow(abs(imButter2), [])
title(sprintf('Image After Butterworth High-Pass Filter %f', d2))
subplot(2,2,4)
imshow(abs(imButter3), [])
title(sprintf('Image After Butterworth High-Pass Filter %f', d3))
