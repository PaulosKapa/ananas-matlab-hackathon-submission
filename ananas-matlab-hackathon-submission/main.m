lat = Position.latitude;
lon = Position.longitude;
peaks = Acceleration.Z;
steps_acc = 0;
average = mean(peaks);
earthCirc = 6371 ;
total_distance = 0;
%calculate gait based on height
height = input("Height in cm: ");
gait = height/100*0.414;
% calculate steps based an accelerometer activity (for reference)

for i = 2:length(peaks)

    if(i+1<length(peaks))
        %check if there is a peak
        if(peaks(i-1)<peaks(i)&&peaks(i+1)<peaks(i)&&peaks(i)>average)
            steps_acc=steps_acc+1;
        end
    end

end

steps_acc
total_distance = distance(lat, lon, earthCirc)*1000
steps = round((total_distance)/gait)
