function [imX] = make_image(x)
% Take a 2D matrix, and return it as an image
% (uint8 values, from 0 to 255).
%
    x=double(x);
    minX = min(min(x));
    maxX = max(max(x));
    scalex = maxX - minX;
    imX = uint8(floor((x - minX)*255/scalex));
end