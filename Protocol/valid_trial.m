function rt = valid_trial(sq, cell, delay)

x_coor = randi(sq);
y_coor = randi(sq);

pos = get(cell{y_coor, x_coor}, 'Position');
pos_arr = pos(1:2);

X = rectangle('Position', [pos_arr 0.2 0.2], 'FaceColor', 'g');
pause(delay)
set(X, 'FaceColor', 'none')
target = text(pos_arr(1,1) + 0.075, pos_arr(1,2) + 0.07, '*', 'Color', 'g', 'Fontsize', 54);
tic
pause
delete(target)
rt = toc;


