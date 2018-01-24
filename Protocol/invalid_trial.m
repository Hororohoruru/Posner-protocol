function [rt, ver_dis, hor_dis] = invalid_trial(sq, cell, delay)

x_coor = randi(sq);
y_coor = randi(sq);

pos = get(cell{y_coor, x_coor}, 'Position');
pos_arr = pos(1:2);

X = rectangle('Position', [pos_arr 0.2 0.2], 'FaceColor', 'g');
pause(delay)
set(X, 'FaceColor', 'none')

num_rep = 1;                            %This loop will generate two random
while num_rep == 1                      %numbers until both are different
    x_target = randi(sq);               %from the ones generated before
    y_target = randi(sq);
    
    if x_coor ~= x_target && y_coor ~= y_target
        num_rep = 0;
    end
end

target_pos = get(cell{y_target, x_target}, 'Position');
target_arr = target_pos(1:2);

target = text(target_arr(1,1) + 0.075, target_arr(1,2) + 0.07, '*', 'Color', 'g', 'Fontsize', 54);
tic
pause
delete(target)
rt = toc;

ver_dis = abs(y_target - y_coor);
hor_dis = abs(x_target - x_coor);
