%Convolution Function

%pseudocode
%rmse-proving properties

%take one function defined on its axes
%flip 2nd function shifted by tau
%move flipped function on axes
%multiply two functions when overlapped
%integrate over overlapped areas
%"area" func
%prove LHS = RHS sqrt(1/NSum(mean)) 

function [conva, x] = DA(F1, F2,w, N, xMax)
    %grid
    dx=xMax/N; %calculated pixel spacing value =, even 0 to N-1
    x=-xMax/2:dx:xMax/2-dx; %xrange
    
    conva = zeros(1, N); %covolution initialized
    
    % GIF filename
    %gif_filename = 'convolution_animation.gif';

    % initial plots
    figure;
    hold on;
    
    NMF1=plot(x, F1(x, w), 'b', 'LineWidth',1.5); % Non-Moving Function
    SF2 = plot(x, F2(x - xMax/2, w), 'r', 'LineWidth',1.5); %Shifting Function
    ConvA= plot(x, conva, 'k', 'LineWidth', 2); %Convolution Area plot
    Shoverlap=area(x, zeros(1, N), 'FaceColor','g', 'FaceAlpha', 0.3, 'EdgeColor', 'none'); % Shaded Overlap
    
    title('Animated Convolution')
    xlabel('\tau and t');
    ylabel('y[a.u]');
    legend([func2str(F1), '(\tau)'], [func2str(F2), '(t-\tau)'], 'Convolution Result (f\otimesg)(t)', 'Shade');
    grid on;
    %ylim([-0.1 1.2]); % Keep y-axis stable
    
    %Animation Loop

    for i= 1:N
        shift_F2 = F2(x(i)-x, w); %shifting Function by tau  JAZZ HANDS!!!
        overlap = F1(x,w) .* shift_F2;% product: shift with Nonmoving Function
        conva(i) = sum(overlap)*dx; %populating convolution *pixel width
        %Chatgpt used to figure out error that was corrected by changing
        %conva data to row from column
        conva = reshape(conva, 1, []);
       
        %Update initial plots
        % Only show shaded overlap when there is an intersection
        %Used CHATGPT for syntax for overlap, and to discover set function
        if any(overlap > 0)
            set(Shoverlap, 'YData', overlap); % Update shaded overlap
        else
            set(Shoverlap, 'YData', zeros(1, N)); % Remove shaded area
        end

        set(SF2, 'YData', shift_F2); % Shifting Function
        
        set(ConvA, 'YData', conva); % Update Convolution 
        
        
        %set(Shoverlap, 'Ydata', overlap); % update shaded overla

        %chatgpt- pause function between each for loop value
        pause(0.01);
    end

    hold off;
    
end
% CHATGPT HOW TO MAKE A GIF FILE SYNTAX, 
% was having problems and didnt have time to fix it
        % online documentation
        % Capture frame for GIF
        % Capture frame for later GIF writing
        % Store frames in an array
        %frames(N) = struct('cdata', [], 'colormap', []); % Preallocate for speed
        %frames(i) = getframe(fig);
        % Convert and save the GIF once at the end
        %disp('Saving GIF...');
        %for i = 1:N
        %    img = frame2im(frames(i));
        %    [A, map] = rgb2ind(img, 256); % Convert to indexed image
        %
        %    if i == 1
        %    imwrite(A, map, gif_filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.05);
        %      else
        %   imwrite(A, map, gif_filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
        %    end
        %end
        %disp(['GIF saved as ', gif_filename]);
        %disp(['Animation saved as ', gif_filename]);
        
