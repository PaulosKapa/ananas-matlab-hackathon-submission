% gait_data.m
height = [160; 165; 170; 175; 180; 185]; % cm
weight = [55; 60; 70; 75; 80; 85];       % kg
age    = [20; 25; 30; 35; 40; 45];       % years

% Simulate gait length (in meters) using a formula + noise
gaitLength = (height./100) .* 0.414 + (randn(size(height)) * 0.01);

% Make table
T = table(height, weight, age, gaitLength, ...
          'VariableNames', {'Height', 'Weight', 'Age', 'GaitLength'});

% Save to MAT file
save('gait_data.mat', 'T');
