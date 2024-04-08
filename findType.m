function [outputArg] = findType(inputArg)
    outputArg = "";
    if any(isstrprop(inputArg,'digit'))
                outputArg = "room_number";
    elseif contains(inputArg, "single") || contains(inputArg, "double") || contains(inputArg, "triple") || contains(inputArg, "quadruple")
                outputArg = "room_type";
    end
            
    if contains(inputArg, "H") || contains(inputArg, "I") 
                outputArg = append(outputArg, "House");
    end
end

