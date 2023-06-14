close all, clear all, clc
% Length of links (m)
l1 = 1;
l2 = 0.4;

% Angle with the horizontal (degrees)
a1 = linspace(0,90,10);
a2 = linspace(0,135,30);

counter = 1;
for i = 1:length(a1);
    theta1 = a1(i);
    for j = 1:length(a2);
        theta2 = a2(j);
        
        x0 = 0;
        y0 = 0;
        
        x1 = l1*cosd(theta1);
        y1 = l1*sind(theta1);
        
        x2 = x1 + l2*cosd(theta2);
        y2 = y1 + l2*sind(theta2);
        
        %Parameters
        txt1 = ['θ1 = ' , num2str(theta1) , ' deg'];
        txt2 = ['θ2 = ' , num2str(theta2) , ' deg'];
        txtend = ['x2 = ' , num2str(x2) , ' , ' , 'y2 = ' , num2str(y2)];
        
        %Plot
        
        plot([x0 x1],[y0 y1],[x1 x2],[y1 y2],'linewidth',5)
        xlabel('X-axis (m)')
        ylabel('Y-axis (m)')
        title('Forward Kinematics of 2R robotic arm')
        text(x0,y0,txt1,'VerticalAlignment','top')
        text(x1,y1,txt2,'VerticalAlignment','top')
        text(x2,y2,txtend,'HorizontalAlignment','left','VerticalAlignment','bottom')
        text(0.5*(x0+x1),0.5*(y0+y1),'  Link 1')
        text(0.5*(x1+x2),0.5*(y1+y2),'  Link 2')
        grid on
        axis([-1 2 -0.5 2])
        pause(0.3)

        M(counter) = getframe(gcf);
        counter = counter+1;
    end
end


% Creating the animation:

movie(M);
videofile = VideoWriter('Forward Kinematics of a 2R Robotic arm.avi','Uncompressed AVI');
open(videofile);
writeVideo(videofile,M);
close(videofile);
        
        