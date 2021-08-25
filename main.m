clear all

propConst = 4;
timeStep = 0.1;

%% Scenario I
s1.missileInit = [0 0;...
              0 1500];
          
s1.targetInit = [0     10000;...
             10000 0;...
             0     0];  
%% Scenario II
s2.missileInit = [0    0;...
              2000 2000];
          
s2.targetInit = [40000 10000;...
             1000  1000;...
             0     0];   
%% Scenario III
s3.missileInit = [0    0;...
             -1500 1500];
          
s3.targetInit = [0    10000;...
             1000 0;...
             0    0];  
%% Scenario IV
s4.missileInit = [0    0;...
              2000 2000];
          
s4.targetInit = [0     10000;...
             -1000 -1000;...
             0     -50];  
%% Scenario V
s5.missileInit = [0    0;...
              2000 2000];
          
s5.targetInit = [40000 10000;...
            -10000 0;...
             0     50];                   
%% Calculations

[s1.true.missileData, s1.targetData, s1.true.distanceData] = proportionalNavigation(s1.missileInit, s1.targetInit, propConst, timeStep, 1);
[s1.pure.missileData, ~, s1.pure.distanceData] = proportionalNavigation(s1.missileInit, s1.targetInit, propConst, timeStep, 0);

[s2.true.missileData, s2.targetData, s2.true.distanceData] = proportionalNavigation(s2.missileInit, s2.targetInit, propConst, timeStep, 1);
[s2.pure.missileData, ~, s2.pure.distanceData] = proportionalNavigation(s2.missileInit, s2.targetInit, propConst, timeStep, 0);

[s3.true.missileData, s3.targetData, s3.true.distanceData] = proportionalNavigation(s3.missileInit, s3.targetInit, propConst, timeStep, 1);
[s3.pure.missileData, ~, s3.pure.distanceData] = proportionalNavigation(s3.missileInit, s3.targetInit, propConst, timeStep, 0);

[s4.true.missileData, s4.targetData, s4.true.distanceData] = proportionalNavigation(s4.missileInit, s4.targetInit, propConst, timeStep, 1);
[s4.pure.missileData, ~, s4.pure.distanceData] = proportionalNavigation(s4.missileInit, s4.targetInit, propConst, timeStep, 0);

[s5.true.missileData, s5.targetData, s5.true.distanceData] = proportionalNavigation(s5.missileInit, s5.targetInit, propConst, timeStep, 1);
[s5.pure.missileData, ~, s5.pure.distanceData] = proportionalNavigation(s5.missileInit, s5.targetInit, propConst, timeStep, 0);

