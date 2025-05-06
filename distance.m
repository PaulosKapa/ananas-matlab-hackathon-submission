function disRes = distance(lat, lon, earthCirc)
    disRes = 0;
    for i = 1: length(lat)-1
        %calculate distance based on gps data
        lat1 = deg2rad(lat(i));
        lon1 = deg2rad(lon(i));
        lat2 = deg2rad(lat(i+1));
        lon2 = deg2rad(lon(i+1));
    
        dlat = lat2 - lat1;
        dlon = lon2 - lon1;
        a = sin(dlat/2)^2 + cos(lat1) * cos(lat2) * sin(dlon/2)^2;
        c = 2 * atan2(sqrt(a), sqrt(1-a));
        disRes = disRes + (earthCirc* c);
        
    end
end