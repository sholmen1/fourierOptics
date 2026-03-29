function [m] = Delta(x, ~)
%Delta
x = round((x)*10^6)/10^6;
m = x==0; %place 1 in out where x==0
end