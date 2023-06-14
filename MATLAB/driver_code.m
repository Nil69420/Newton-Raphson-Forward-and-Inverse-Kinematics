clear, pack, clc
options = optimoptions(@fsolve,'Algorithm','trust-region','Display','iter', 'UseParallel',false,'OptimalityTolerance',1.0000e-8,'FunctionTolerance',1.0000e-12)

%%test cases
%x=0.8; y=0; l1=0.3;l2=0.5; % horizonal position, theta1=0 [deg], theta2=0 [deg]
x=0.4; y=0.4; l1=0.4;l2=0.4; % horizonal position, theta1=0 [deg], theta2=90 [deg]

%initialGuessDegrees[10; 10] %for 0-0
initialGuessDegrees=[70; 60]
initialGuessRadians=initialGuessDegrees*(pi/180)

[solutionThetaRadians] = fsolve(@(theta)kinematics(theta,x,y,l1,l2),initialGuessRadians,options)
  
kinematics(solutionThetaRadians,x,y,l1,l2)
 
solutionThetaDegrees=solutionThetaRadians*(180/pi)