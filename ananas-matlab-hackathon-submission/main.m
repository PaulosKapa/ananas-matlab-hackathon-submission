lat = Position.latitude;
lon = Position.longitude;
peaks = Acceleration.Z;
steps_acc = 0;
average = mean(peaks);
earthCirc = 40075 ;
total_distance = 0;
for i = 2:length(peaks)
    
    if(i+1<length(peaks))
        if(peaks(i-1)<peaks(i)&&peaks(i+1)<peaks(i)&&peaks(i)>average)
            steps_acc=steps_acc+1;
        end
    end

end
for i = 1: length(lat)-1
    
    lat1 = deg2rad(lat(i));
    lon1 = deg2rad(lon(i));
    lat2 = deg2rad(lat(i+1));
    lon2 = deg2rad(lon(i+1));
    
    dlat = lat2 - lat1;
    dlon = lon2 - lon1;
    a = sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    total_distance = total_distance + (earthCirc* c);
    
end
steps_acc
total_distance*1000
steps = round((total_distance*1000)/0.7)
