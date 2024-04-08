%Preferences, column 1 is initial endowment
p1 = ["h1" "h1" "h2" "h3" "h4" "h5"];
p2 = ["h2" "h4" "h5" "h3" "h2" "h1"];
p3 = ["h3" "h5" "h2" "h1" "h4" "h3"];
p4 = ["h4" "h1" "h4" "h5" "h3" "h2"];
p5 = ["n/a" "h5" "h4" "h3" "h2" "h1"];
students = [p1; p2; p3; p4; p5];

assigned_students = [];
assigned_houses = [];
available_houses = ["h1" "h2" "h3" "h4" "h5"];
i = 1;
n = 2;

restartNumbers = [];

    %for loop iterating through every student
    while i <= height(students)
        %for loop iterating through every student's preference
        while n <= width(students)
            %check if student's initial endowment is student's first preference
            if students(i, 1) == students(i, n)
                %check if student's preference is available
                if any(contains(available_houses, students(i, n)))
                    assigned_students = [assigned_students i];
                    assigned_houses = [assigned_houses students(i, n)];
                    available_houses = available_houses(available_houses~=students(i, 1));
                    break
                else
                    restartNumber = assigned_students(find(assigned_houses==students(i, n)));
                    assigned_housesNumber = length(assigned_houses);
                    available_houses = [available_houses assigned_houses(restartNumber:assigned_housesNumber)];
                    available_houses = available_houses(available_houses~=students(i, n));
                    assigned_houses(ismember(assigned_houses, assigned_houses(restartNumber:assigned_housesNumber))) = [];
                    assigned_houses = [assigned_houses students(i, n)];
                    assigned_students(ismember(assigned_students,restartNumber:assigned_housesNumber)) = [];
                    assigned_students = [assigned_students i];
                    restartNumbers = [restartNumbers i];
                    i = restartNumber - 1;
                    n = 2;
                    break
                end
            %check if student's preference is available
            elseif any(contains(available_houses, students(i, n)))
                assigned_students = [assigned_students i];
                assigned_houses = [assigned_houses students(i, n)];
                available_houses = available_houses(available_houses~=students(i, n));
                break
            end
            n = n + 1;
        end
        i = i + 1;
        if any(ismember(i, restartNumbers))
            i = i + 1;
        end
    end