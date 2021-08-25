clear all
clc
close

propConst = 4;
timeStep = 0.1;
%% Scenario I
s1.missileInit = [0 0;...
                  0 1500];
          
s1.targetInit = [0    10000;...
                1000  0;...
                0     0];
s1.endTime = 10;            
%% Scenario II
s2.missileInit = [0    0;...
                  2000 2000];
          
s2.targetInit = [40000 10000;...
                 1000  1000;...
                 0     0];
s2.endTime = 40;             
%% Scenario III
s3.missileInit = [0    0;...
                 -1500 1500];
          
s3.targetInit = [0    10000;...
                 1000 0;...
                 0    0];
s3.endTime = 20;             
%% Scenario IV
s4.missileInit = [0    0;...
                  2000 2000];
          
s4.targetInit = [0     10000;...
                -1000 -1000;...
                 0     -50];
s4.endTime = 15;                
%% Scenario V
s5.missileInit = [0    0;...
                  2000 2000];
          
s5.targetInit = [40000 10000;...
                -10000 0;...
                 0     50];
s5.endTime = 15;             
%% Calculations
    % Scenario I
    [s1.true.missileData, s1.targetData, s1.true.distanceData] = propNav(s1.missileInit, s1.targetInit, propConst, timeStep, s1.endTime, 1);
    [s1.pure.missileData, ~, s1.pure.distanceData] = propNav(s1.missileInit, s1.targetInit, propConst, timeStep, s1.endTime, 0);

    % Scenario II
    [s2.true.missileData, s2.targetData, s2.true.distanceData] = propNav(s2.missileInit, s2.targetInit, propConst, timeStep, s2.endTime, 1);
    [s2.pure.missileData, ~, s2.pure.distanceData] = propNav(s2.missileInit, s2.targetInit, propConst, timeStep, s2.endTime, 0);

    % Scenario III
    [s3.true.missileData, s3.targetData, s3.true.distanceData] = propNav(s3.missileInit, s3.targetInit, propConst, timeStep, s3.endTime, 1);
    [s3.pure.missileData, ~, s3.pure.distanceData] = propNav(s3.missileInit, s3.targetInit, propConst, timeStep, s3.endTime, 0);

    % Scenario IV
    [s4.true.missileData, s4.targetData, s4.true.distanceData] = propNav(s4.missileInit, s4.targetInit, propConst, timeStep, s4.endTime, 1);
    [s4.pure.missileData, ~, s4.pure.distanceData] = propNav(s4.missileInit, s4.targetInit, propConst, timeStep, s4.endTime, 0);

    % Scenario V
    [s5.true.missileData, s5.targetData, s5.true.distanceData] = propNav(s5.missileInit, s5.targetInit, propConst, timeStep, s5.endTime, 1);
    [s5.pure.missileData, ~, s5.pure.distanceData] = propNav(s5.missileInit, s5.targetInit, propConst, timeStep, s5.endTime, 0);
%% Plotting
    % Scenario I True
    figure('Name', 'Scenario I - True Proportional')

    subplot(2,1,1)
    plot(s1.true.missileData.pos(:,1), s1.true.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s1.targetData.pos(:,1), s1.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s1.true.distanceData.t, s1.true.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

    % Scenario I Pure
    figure('Name', 'Scenario I - Pure Proportional')

    subplot(2,1,1)
    plot(s1.pure.missileData.pos(:,1), s1.pure.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s1.targetData.pos(:,1), s1.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s1.pure.distanceData.t, s1.pure.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Scenario II True
    figure('Name', 'Scenario II - True Proportional')

    subplot(2,1,1)
    plot(s2.true.missileData.pos(:,1), s2.true.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s2.targetData.pos(:,1), s2.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s2.true.distanceData.t, s2.true.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

    % Scenario II Pure
    figure('Name', 'Scenario II - Pure Proportional')

    subplot(2,1,1)
    plot(s2.pure.missileData.pos(:,1), s2.pure.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s2.targetData.pos(:,1), s2.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s2.pure.distanceData.t, s2.pure.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Scenario III True
    figure('Name', 'Scenario III - True Proportional')

    subplot(2,1,1)
    plot(s3.true.missileData.pos(:,1), s3.true.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s3.targetData.pos(:,1), s3.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s3.true.distanceData.t, s3.true.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

    % Scenario III Pure
    figure('Name', 'Scenario III - Pure Proportional')

    subplot(2,1,1)
    plot(s3.pure.missileData.pos(:,1), s3.pure.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s3.targetData.pos(:,1), s3.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s3.pure.distanceData.t, s3.pure.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Scenario IV True
    figure('Name', 'Scenario IV - True Proportional')

    subplot(2,1,1)
    plot(s4.true.missileData.pos(:,1), s4.true.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s4.targetData.pos(:,1), s4.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s4.true.distanceData.t, s4.true.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

    % Scenario IV Pure
    figure('Name', 'Scenario IV - Pure Proportional')

    subplot(2,1,1)
    plot(s4.pure.missileData.pos(:,1), s4.pure.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s4.targetData.pos(:,1), s4.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s4.pure.distanceData.t, s4.pure.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Scenario V True
    figure('Name', 'Scenario V - True Proportional')

    subplot(2,1,1)
    plot(s5.true.missileData.pos(:,1), s5.true.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s5.targetData.pos(:,1), s5.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s5.true.distanceData.t, s5.true.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')

    % Scenario V Pure
    figure('Name', 'Scenario V - Pure Proportional')

    subplot(2,1,1)
    plot(s5.pure.missileData.pos(:,1), s5.pure.missileData.pos(:,2),'DisplayName','Missile')
    hold on
    plot(s5.targetData.pos(:,1), s5.targetData.pos(:,2),'DisplayName','Target')
    title('XY Position')
    xlabel('X (m)')
    ylabel('Y (m)')
    legend('Location','Best')

    subplot(2,1,2)
    plot(s5.pure.distanceData.t, s5.pure.distanceData.overTime)
    title('Distance Between Target and Missile over Time')
    ylabel('Distance (m)')
    xlabel('Time (s)')    
   




