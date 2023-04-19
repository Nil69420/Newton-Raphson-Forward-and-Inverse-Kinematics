close all, clear all, clc

% Link length
l1  = 1;
l2 = 1;

%Joint angles
theta1 = 0;
theta2 = pi/2;

%Forward Kinematics
mu_a = [l1*cos(theta1)+l2*cos(theta1+theta2);
        l1*sin(theta1)+l2*sin(theta1+theta2);];
q = [pi/3;0.2];

%newton_rapson
for i = 1:20
    theta1 = q(1);
    theta2 = q(2);
    
    J = [-l2*sin(theta1+theta2)-l1*sin(theta1),-l2*sin(theta1+theta2);
          l2*cos(theta1+theta2)+l1*cos(theta1), l2*cos(theta1+theta2);];
    mu_e = [l1*cos(theta1)+l2*cos(theta1+theta2);
            l1*sin(theta1)+l2*sin(theta1+theta2);];
    %Error
    delta = mu_a-mu_e;
    
    %Tolerance
    if abs(delta)<1e-5
        break;
    end
    %Joint space position
    q = q + inv(J) * (delta);
    
    %Plot
    plot([0 l1*cos(theta1) mu_e(1)], [0 l1*sin(theta1) mu_e(2)], 'b-o')
    hold on
    plot(mu_a(1),mu_a(2),'r*','markersize',10)
    plot(0,0,'ks','markersize',10)
    axis([-(l1+l2) (l1+l2) -(l1+l2) (l1+l2)])
    grid on
    pause(3)
end