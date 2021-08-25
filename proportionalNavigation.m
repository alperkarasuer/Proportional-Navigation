function [missileData, targetData, distanceData]  = proportionalNavigation(missileInit, targetInit, propConst, stepSize, isTrue)
    t = (0:stepSize:40)';
    
    target.pos(1,:) = targetInit(1,:);
    target.vel(1,:) = targetInit(2,:);
    target.accel = targetInit(3,:);
    
    missile.pos(1,:) = missileInit(1,:);
    missile.vel(1,:) = missileInit(2,:); 
    

    for i = 1:size(t,1)-1
        target.vel(i+1,:) = target.vel(i,:) + target.accel.*stepSize;
        target.pos(i+1,:) = target.pos(i,:) + target.vel(i,:).*stepSize;

        lambdaD = lambdaDot(missile, target, i);
        vClose = closingSpeed(missile, target, i);
        nc = propConst*lambdaD*vClose;

        if isTrue == 1
            lambda = atan((target.pos(i,2) - missile.pos(i,2))/(target.pos(i,1) - missile.pos(i,1)));
            amx = -nc*sin(lambda);
            amy = nc*cos(lambda);
        elseif isTrue == 0
            gamma = atan(missile.vel(i,2)/missile.vel(i,1));
            amx = -nc*sin(gamma);
            amy = nc*cos(gamma);
        end

        missile.accel(i,:) = [amx amy];
        missile.vel(i+1,:) = missile.vel(i,:) + missile.accel(i,:)*stepSize;
        missile.pos(i+1,:) = missile.pos(i,:) + missile.vel(i,:)*stepSize;

    end

    [distance.overTime, distance.min] = minimumDistance(missile,target);
    
    missileData = missile;
    targetData = target;
    distanceData = distance;

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

    function [dist, minDist] = minimumDistance(pred, prey)
        predPos = pred.pos;
        preyPos = prey.pos;
        dist = sqrt((preyPos(:,1) - predPos(:,1)).^2 + (preyPos(:,2) - predPos(:,2)).^2);
        minDist = min(dist);
    end   

end