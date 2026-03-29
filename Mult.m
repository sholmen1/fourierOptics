function [plots] = Mult()
%Multiplicative
%f convolve with Delta = f
% f = cdexp
%grid
xMax = 2;
N = 128;
dx=xMax/N; %calculated pixel spacing value =, even 0 to N-1
x=-xMax/2:dx:xMax/2-dx; %xrange

multCon = DA(@cdexp, @Delta, 1, 128, 2);
cDexp = cdexp(x, 1);

close all;

% Plot Results
figure;
plot(x, multCon, 'b', 'LineWidth', 1.5);
hold on;
plot(x, cDexp, 'r--', 'LineWidth', 1.5);
hold off;
    
title('Multiplicative Property Verification: f * δ = f');
xlabel('x');
ylabel('y');
legend('Convolution Result', 'Original Function');
grid on;
    
% Return the plotted data
plots = struct('x', x, 'multCon', multCon, 'cDexp', cDexp);

end