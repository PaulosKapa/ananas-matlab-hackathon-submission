function steps = main(filename, height, weight, age)
load(filename);
load('gaitModel.mat', 'gaitModel');



    % Assuming your .mat file contains a variable named "data"

lat = Position.latitude;
lon = Position.longitude;
peaks = Acceleration.Z;
steps_acc = 0;
average = mean(peaks);
earthCirc = 6371 ;
total_distance = 0;
gait = predict(gaitModel, table(height, weight, age, 'VariableNames', {'Height', 'Weight', 'Age'}));
% calculate steps based an accelerometer activity (for reference)

for i = 2:length(peaks)

    if(i+1<length(peaks))
        %check if there is a peak
        if(peaks(i-1)<peaks(i)&&peaks(i+1)<peaks(i)&&peaks(i)>average)
            steps_acc=steps_acc+1;
        end
    end

end



total_distance = distance(lat, lon, earthCirc)*1000;
steps = round((total_distance)/gait)
save("steps.mat", "steps")
end
