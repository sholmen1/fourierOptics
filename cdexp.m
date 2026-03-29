function e = cdexp(x,w)

    epsilon = 0.01;
    alpha = -w/log(epsilon);
    e = exp(-x/alpha).*rect(x-w/2,w);

end