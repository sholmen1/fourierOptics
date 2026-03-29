function d = nifft2(c,dfx, dfy, N)

[M,n]=size(c);
V = N*N*dfx*dfy;
d = V*ifftshift(ifft2(fftshift(c)));

end

%Note: Algorithm developed with Dan Adam in Office Hours
%Implements Normalized Inverse Fast Fourier Transform 2D