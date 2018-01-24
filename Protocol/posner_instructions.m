function posner_instructions

inst_counter = 0;

for n = 1:3
    if inst_counter == 0
        inst = sprintf(['Now you will perform a visual search experiment.\n'...
    'Your objective is to look for the target ''*''\nas fast' ...
    ' as you can.\n\n(Press any key to continue)']);
    elseif inst_counter == 1
        inst = sprintf(['Before the target appears, you will see a visual cue.' ...
    '\nThe targer may or may not appear in the same position.\nPress' ...
    ' the spacebar as soon as you see the target\nAlso, you must look at the' ...
    ' center of the screen\nfor the entire duration of the experiment.']);
    else
        inst = sprintf(['When you are ready, press any key to start the' ...
    ' experiment.\nA cross will appear on the center of the screen' ...
    '\nbefore the experiment starts.\n\nPlease do not press any key\n' ...
    'while the cross is on screen']);
    end
    axis off
    text(0.5, 0.5, inst, 'HorizontalAlignment', 'center', 'FontSize', 14)
    pause
    delete(gca)
    inst_counter = inst_counter + 1;
end