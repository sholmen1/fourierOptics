function t = rightTri(x,w)

    t = (1-abs(x/w)) .* rect(x-w/2,w);

end
