function[square, limit] = grid(rect)

%The grid argument represents the number of desired rectangles in the grid
%(9, 16, 25, etc.)

if sqrt(rect) ~= round(sqrt(rect))
    error('Please, input a number with an exact square root (9, 16, etc.)')
    return
end

square = sqrt(rect);
limit = square / 10 * 2;