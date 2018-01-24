clear variables
close all

h = figure('Color', 'w', 'ToolBar', 'none', 'MenuBar', 'none');

%Instructions

posner_instructions
posner_cross(5)

%Creation of the grid

grd = 16;                %Number of squares in the figure, default 16
[sq, lmt] = grid(grd);   %Calculations for the limits of the axes
xlim([0 lmt]);
ylim([0 lmt]);
axis off

rect_cell = cell(sq);    %This cell array will contain handles for all 
y_count = 1;             %rectangles
x_count = 1;
for jj = (lmt - 0.2):-0.2:0
    for ii = 0:0.2:(lmt - 0.2)
        rect_cell{y_count, x_count} = rectangle('Position', [ii jj 0.2 0.2]);
        x_count = x_count + 1;
    end
    y_count = y_count + 1;
    x_count = 1;
end

%Protocol

[valid_mat, invalid_mat] = protocol(1280, sq, rect_cell);

%Final clearing of unnecessary variables

inst = sprintf(['The experiment has ended\nThank you very much for your'...
    'participation']);
axis off
text(0.5, 0.5, inst, 'HorizontalAlignment', 'center', 'FontSize', 14)
pause
delete(gca)

clear ii
clear jj
clear grd
clear lmt
clear rect_cell
clear sq
clear h
clear x_count
clear y_count
clear inst
close all