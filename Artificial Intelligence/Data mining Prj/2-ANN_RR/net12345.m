% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by NFTOOL
% Created Fri Jan 01 22:34:46 IRST 2016
%
% This script assumes these variables are defined:
%
%   tr12345 - input data.
%   trout - target data.

inputs = tr12345';
targets = trout';

% Create a Fitting Network
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);


% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 90/100;
net.divideParam.valRatio = 5/100;
net.divideParam.testRatio = 5/100;


% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotfit(net,inputs,targets)
%figure, plotregression(targets,outputs)
%figure, ploterrhist(errors)
