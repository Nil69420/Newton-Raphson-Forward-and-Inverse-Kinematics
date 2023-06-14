function F=kinematics(theta,x,y,l1,l2)
F=[x-l1*cos(theta(1))-l2*cos(theta(1)+theta(2));
   y-l1*sin(theta(1))-l2*sin(theta(1)+theta(2))];
end