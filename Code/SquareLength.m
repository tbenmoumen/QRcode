function M = SquareLength(sortPoints)
% This function uses the result from the SortCoins function. sortPoints is
% a 4*2 matrix with 4 differents points, sorted to make a P1P2P3P4
% non-crossed quadrilateral figure. The points are line (y x) or (j i) vectors.
% This function caculates the longest length between the 4 points.

% Extract the points from the matrix
y1 = sortPoints(1, 2);
y2 = sortPoints(2, 2);
y3 = sortPoints(3, 2);
y4 = sortPoints(4, 2);
x1 = sortPoints(1, 1);
x2 = sortPoints(2, 1);
x3 = sortPoints(3, 1);
x4 = sortPoints(4, 1);

a = (x2 - x1)^2 + (y2 - y1)^2;
b = (x3 - x2)^2 + (y3 - y2)^2;
c = (x3 - x4)^2 + (y3 - y4)^2;
d = (x4 - x1)^2 + (y4 - y1)^2;

M = round(sqrt(max([a b c d])));
