function [distrib] = Dist()
%Distributivity: f(g+h)=fg+fh
% Functions being convolved: g = rect, h = isoTri, f = cdexp
%grid
xMax = 2;
N = 128;
dx=xMax/N; %calculated pixel spacing value =, even 0 to N-1
x=-xMax/2:dx:xMax/2-dx; %xrange

fg = DA(@cdexp, @rect, 1, 128, 2);%f convolved with g
gh = DA(@cdexp, @isoTri, 1, 128, 2); % f convolved with h

rect_Itri = DA(@cdexp, @rplusItri, 1, 128, 2); %f convolve with g+h

RHS = fg+ gh;

%rmse calc

distrib = sqrt(mean((rect_Itri-RHS).^2));
end
