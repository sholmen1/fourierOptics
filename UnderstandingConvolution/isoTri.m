function t = isoTri(x,w)

    t = (1-abs(2*x/w)) .* rect(x,w);

end
