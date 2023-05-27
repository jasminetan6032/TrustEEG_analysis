function distance = get_distance_half (unit1,unit2) %unit 1 = participant response, unit 2 = True orientation, takes units in degrees
    phi = mod(abs(unit2-unit1), 180);
    sign = 1;
    if  not((unit1-unit2 >= 0 & unit1-unit2 <= 90) | (unit1-unit2 <= -90 & unit1-unit2 >= -180))
        sign = -1;
    end 
        
    if phi>90
        result = 180-phi;
    else
        result = phi;
    end 
  
    distance = result*sign;

    end 