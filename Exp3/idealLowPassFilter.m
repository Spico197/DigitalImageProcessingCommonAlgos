function re = idealLowPassFilter(imGray, d)

imFFT = fft2(imGray);
imFFTShift = fftshift(imFFT);
[rows, cols] = size(imFFTShift);
D = zeros(rows, cols);
for row = 1 : rows
    for col = 1 : cols
        D(row, col) = sqrt(double((row - int32(rows/2))^2 + (col - int32(cols/2))^2));
    end
end

figure
subplot(2,2,1)
imshow(log10(abs(imFFT)), [])
title('FFT')

subplot(2,2,2)
imshow(log10(abs(imFFTShift)), [])
title('FFT Shift')

imFFTShift(D > d) = 0;
antiShift = ifftshift(imFFTShift);
iImFFT = ifft2(antiShift);
re = iImFFT;

subplot(2,2,3)
imshow(log10(abs(imFFTShift)), [])
title('Filter')
subplot(2,2,4)
imshow(log10(abs(antiShift)), [])
title('IFFT Shift')

end
