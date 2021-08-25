clear all

h = 0.001;
t = (0:h:40)';
N = 4;


missile.init = [0 0; 0 1500];
target.init = [0 10000; 1000 0];
target.accel = [0 0];

[target.pos target.vel] = targetTrajectory(t,target);

for i = 1:size(t,1)-1
    if i == 1
        missile.pos(1,:) = missile.init(1,:);
        missile.vel(1,:) = missile.init(2,:);
    end
    lambda = atan((target.pos(i,2) - missile.pos(i,2))/(target.pos(i,1) - missile.pos(i,1)));
    lambdaD = lambdaDot(missile, target, i);
    vClose = closingSpeed(missile, target, i);
    nc = N*lambdaD*vClose;
    
    amx = -nc*sin(lambda);
    amy = nc*cos(lambda);
    missile.accel(i,:) = [amx amy];
    
    missile.vel(i+1,:) = missile.vel(i,:) + missile.accel(i,:)*h;
    missile.pos(i+1,:) = missile.pos(i,:) + missile.vel(i,:)*h;
    
end

[a,b] = minimumDistance(missile,target);

plot(target.pos(:,1),target.pos(:,2))
hold on
plot(missile.pos(:,1), missile.pos(:,2))



function [pos,vel] = targetTrajectory(t,prey)
    pos(1,:) = prey.init(1,:);
    vel(1,:) = prey.init(2,:);
    h = t(2) - t(1);
    for i = 1:size(t,1)-1
        vel(i+1,:) = vel(i,:) + prey.accel.*h;
        pos(i+1,:) = pos(i,:) + vel(i,:).*h;
    end
end

function lDot = lambdaDot(pred, prey, i)
   [xt, yt] = deal(prey.pos(i,1), prey.pos(i,2));
   [xm,  ym] = deal(pred.pos(i,1), pred.pos(i,2));
   [Vtx, Vty] = deal(prey.vel(i,1), prey.vel(i,2));
   [Vmx,  Vmy] = deal(pred.vel(i,1), pred.vel(i,2));
   lDot = ((xt - xm)*(Vty - Vmy) - (yt - ym)*(Vtx - Vmx))/((xt - xm)^2 + (yt - ym)^2);
end

function Vc = closingSpeed(pred, prey, i)
   [xt, yt] = deal(prey.pos(i,1), prey.pos(i,2));
   [xm,  ym] = deal(pred.pos(i,1), pred.pos(i,2));
   [Vtx, Vty] = deal(prey.vel(i,1), prey.vel(i,2));
   [Vmx,  Vmy] = deal(pred.vel(i,1), pred.vel(i,2));
   Vc = -((xt - xm)*(Vtx - Vmx) + (yt - ym)*(Vty - Vmy))/(sqrt((xt - xm)^2 + (yt - ym)^2));
end

function [distances, minDist] = minimumDistance(pred, prey)
    predPos = pred.pos;
    preyPos = prey.pos;
    
    distances = sqrt((preyPos(:,1) - predPos(:,1)).^2 + (preyPos(:,2) - predPos(:,2)).^2);
    minDist = min(distances);
end
    
    

