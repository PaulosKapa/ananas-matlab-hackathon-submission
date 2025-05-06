% trainGaitModel.m
load('gait_data.mat');  % Load dataset

% Train a regression model (you can use fitrensemble, fitrnet, etc. for more accuracy)
gaitModel = fitlm(T, 'GaitLength ~ Height + Weight + Age');

% Save model to file
save('gaitModel.mat', 'gaitModel');