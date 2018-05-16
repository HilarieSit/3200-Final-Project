close all
clear all
clc
SF = load('springforce.mat');
DF = load('dampingforce.mat');

[k, c] = leastsquaresfit(SF, DF);