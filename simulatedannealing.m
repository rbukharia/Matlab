function s = simulatedannealing(inputcities,initial_temperature,...
    final_temperature,cooling_rate,threshold,numberofcitiestoswap)
global iterations;

% set nilai temperatuure awal dan final
temperature = initial_temperature;
temperature2 = final_temperature;


initial_cities_to_swap = numberofcitiestoswap;

% set nilai iterasi jadi 1
iterations = 1;

complete_temperature_iterations = 0;

% algoritma untuk menentukan total jarak tempuh setelah 10 iterasi
while temperature > temperature2
previous_distance = distance(inputcities);
while iterations < threshold
    temp_cities = swapcities(inputcities,numberofcitiestoswap);
    current_distance = distance(temp_cities);
    diff = abs(current_distance - previous_distance);
    if current_distance < previous_distance
        inputcities = temp_cities;
        if rem(iterations,100) == 0
                plotcities(inputcities);
        end
        if complete_temperature_iterations >= 10
            temperature = cooling_rate*temperature;
            complete_temperature_iterations = 0;
        end
        numberofcitiestoswap = round(numberofcitiestoswap...
            *exp(-diff/(iterations*temperature)));
        if numberofcitiestoswap == 0
            numberofcitiestoswap = 1;
        end
        previous_distance = current_distance;
        iterations = iterations + 1;
        complete_temperature_iterations = complete_temperature_iterations + 1;
    else
        if rand(1) < exp(-diff/(temperature))
            inputcities = temp_cities;
            if rem(iterations,100) == 0
                plotcities(inputcities);
            end
            numberofcitiestoswap = round(numberofcitiestoswap...
                *exp(-diff/(iterations*temperature)));
            if numberofcitiestoswap == 0
                numberofcitiestoswap = 1;
            end
            previous_distance = current_distance;
            complete_temperature_iterations = complete_temperature_iterations + 1;
            iterations = iterations + 1;
        end
    end
end
end