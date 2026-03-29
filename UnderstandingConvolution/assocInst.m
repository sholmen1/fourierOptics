%2. Associativity: f(gh)=(fg)h

function [assoc] = assocInst()

% Functions being convolved: g = rect, h = isoTri, f = cdexp
[x, Fgh] = DA(@rect, @isoTri, 1, 128, 2);

[x_unique, idx] = unique(x);  % Remove duplicates
%CHATGPT recommended gridded interpolant, verified it worked by verifying
%with final rmse value of 0!!!!
%chatgpt made objects, and evaluated as anonymous functions
Fgh_interp_obj = griddedInterpolant(x_unique, Fgh(idx), 'linear', 'none'); % Interpolator
Fgh_interp = @(x, w) Fgh_interp_obj(x); % Convert to anonymous function

[~, Fgh_Result] = DA(@cdexp, Fgh_interp, 1, 128, 2);


[x, fgH] = DA(@cdexp, @rect, 1, 128, 2);
[x_unique, idx] = unique(x);  % Remove duplicates
fgH_interp_obj = griddedInterpolant(x_unique, fgH(idx), 'linear', 'none'); % Interpolator
fgH_interp = @(x, w) fgH_interp_obj(x); % Convert to anonymous function

[~, fgH_Result] = DA(fgH_interp, @isoTri, 1, 128, 2);

%rmse calc

assoc = sqrt(mean((Fgh_Result-fgH_Result).^2));

end
