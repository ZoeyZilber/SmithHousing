p1 = ["104I" "single" "H" "I" "n/a"];
p2 = ["104I" "101H" "102H" "104I" "103I"];
p3 = ["102H" "doubleH" "singleH" "doubleI" "singleI"];
p4 = ["101H" "101H" "double" "single" "n/a"];
p5 = ["102H" "double" "neighborhood" "n/a" "n/a"];
p6 = ["n/a" "I" "single" "double" "n/a"];
students = [p1; p2; p3; p4; p5; p6];

waitlist_H = [];
waitlist_I = [];
waitlist_single = [];
waitlist_double = [];

assigned = [];
available_houses = ["H" "I"];
H = ["101H"; "102H"];
I = ["103I"; "104I"];

available_rooms = [H I];

%while loop comparing number of students to number of students assigned rooms
while height(students) ~= length(assigned) 
    %for loop iterating through every student
    for i = 1:length(students)
        %for loop iterating through every student's preference
        for n = 2:width(students)
            %check if student's initial endowment is student's first preference
            if students(i, 1) == students(i, n)
                assigned = [assigned(1, :) i; assigned(2, :) students(i, 1)];
                available_rooms = available_rooms(available_rooms~=students(i, 1));
            %Check if student's preference is a room number
            elseif ismember(students(i, n), available_rooms)
                assigned = [assigned(1, :) i; assigned(2, :) students(i, 1)];
                available_rooms = available_rooms(available_rooms~=students(i, n));
            %Check if student's preference is a room type in a house
            elseif findType(students(i, n)) == "room_typeHouse"
                if contains(students(i, n), "single") && width(available_rooms(1, :)) >  length(waitlist_single)
                    waitlist_single = [waitlist_single students(i, :)];
                    if contains(students(i, n), "H") && height(available_rooms(:, 1)) >  length(waitlist_H)
                        waitlist_H = [waitlist_H students(i, :)];
                    elseif contains(students(i, n), "I") && height(available_rooms(:, 2)) >  length(waitlist_I)
                        waitlist_I = [waitlist_I students(i, :)];
                    end
                elseif contains(students(i, n), "double") && width(available_rooms(2, :)) >  length(waitlist_double)
                    waitlist_double = [waitlist_double students(i, :)];
                    
                end
            %Check if student's preference is a house
            elseif findType(students(i, n)) == "House"
                if contains(students(i, n), available_houses)
            %Check if student's preference is a room type
            elseif findType(students(i, n)) == "room_type"

            end
        end
    end
end