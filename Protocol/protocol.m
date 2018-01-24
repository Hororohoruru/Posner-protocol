function [valid_mat, invalid_mat] = protocol(trials, sq, cell)

proto_valid_mat = zeros(trials, 2);       %Preallocating matrices. They
proto_invalid_mat = zeros(trials, 5);     %will be shortened at the end
val_count = 1;
inval_count = 1;                          %These two indices will determine
                                          %the position for allocating
                                          %data in the matrices
for n = 1:trials
    
    rand_cond = rand(1);                  %These two random numbers will determine
	rand_delay = rand(1);             %the condition and delay of each trial
    
    if rand_delay <= 0.5                  %Determination of the delay
        delay = 0.1;
    else
        delay = 0.3;
    end
    
    if rand_cond <= 0.5                                %Valid trial, response time
        rt = valid_trial(sq, cell, delay);             %is stored in the first column
        proto_valid_mat(val_count, 1) = rt;            %and delay in the second of 
		proto_valid_mat(val_count, 2) = delay; %the matrix
		val_count = val_count + 1;
    else
        [rt, hor, ver] = invalid_trial(sq, cell, delay);
        proto_invalid_mat(inval_count, 1) = rt;        %Invalid trial. Same thing,
        proto_invalid_mat(inval_count, 2) = delay;     %but it stores the horizontal,
        proto_invalid_mat(inval_count, 3) = hor;       %vertical and total distance
        proto_invalid_mat(inval_count, 4) = ver;       %between cue and target
        proto_invalid_mat(inval_count, 5) = hor + ver;
        inval_count = inval_count + 1;
    end
end

valid_mat = proto_valid_mat(any(proto_valid_mat, 2), :);
invalid_mat = proto_invalid_mat(any(proto_invalid_mat, 2), :);

delete(gca);

%These last two lines will pass the proto matrices to the definitive ones,
%getting rid of all the rows with all 0 in the process
