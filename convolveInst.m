function   [comm] = convolveInst()

fg = DA(@cdexp, @rect, 1, 128, 2);%f convolved with g
gf = DA(@rect, @cdexp, 1, 128, 2); % g convolved with f

close all;

plot(fg)
hold on;
plot((gf))
hold off;

comm = sqrt(mean((fg-gf).^2));  %commutativity equality

end