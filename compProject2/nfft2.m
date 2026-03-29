function b = nfft2(a,dx, dy)

[M,N]=size(a);
V = dx*dy;
b = V*ifftshift(fft2(fftshift(a)));

end
%Note: Algorithm developed with Dan Adam in Office Hours
%Implements Normalized Fast Fourier Transform 2D