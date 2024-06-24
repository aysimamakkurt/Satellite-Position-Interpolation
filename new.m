function [coordinates] = new( ts,prn,filename )
%ts= select time intervel (second format)
[sat] = read_sp3file(filename);
%sp3 file's time interval (15 minute=900 seconds)
t=0:900:86399;
%new file's time interval 
new_t=0:ts:86399;
sira=new_t/900+1;
au=floor(sira);
ba=ceil(sira);
if au-4<1
    x_coor=sat(1:10,1,prn);
    y_coor=sat(1:10,2,prn);
    z_coor=sat(1:10,3,prn);
    t=t(1:10);
elseif ba+4>96
    x_coor=sat(87:96,1,prn);
    y_coor=sat(87:96,2,prn);
    z_coor=sat(87:96,3,prn);
    t=t(87:96);
    
else   
    x_coor=sat(:,1,prn);
    y_coor=sat(:,2,prn);
    z_coor=sat(:,3,prn);
    
end
%x coordinates
x_coor=sat(:,1,prn);
n=length(t)-1;
sm=0;
for i=1:n+1
    pr=1;
    for j=1:n+1
        if j ~= i
            pr=pr.*(new_t-t(j))./(t(i)-t(j));
        end
    end
    sm=sm+x_coor(i)*pr;
end
new_x=sm*10^-3;
y_coor=sat(:,2,prn);
sm2=0;
for i=1:n+1
    pr=1;
    for j=1:n+1
        if j ~= i
            pr=pr.*(new_t-t(j))./(t(i)-t(j));
        end
    end
    sm2=sm2+y_coor(i).*pr;
end
new_y=sm2*10^-3;

z_coor=sat(:,3,prn);
sm3=0;
for i=1:n+1
    pr=1;
    for j=1:n+1
        if j ~= i
            pr=pr.*(new_t-t(j))./(t(i)-t(j));
        end
    end
    sm3=sm3+z_coor(i).*pr;
end
new_z=sm3*10^-3;
coordinates=[new_x' new_y' new_z'];
subplot(3,2,1)
plot(coordinates(50:240,1))
title('x coordinates','fontsize',14)
subplot(3,2,2)
plot(coordinates(:,1))
title('x coordinates','fontsize',14)
subplot(3,2,3)
plot(coordinates(50:240,2))
title('y coordinates','fontsize',14)
subplot(3,2,4)
plot(coordinates(:,2))
title('y coordinates','fontsize',14)
subplot(3,2,5)
plot(coordinates(50:240,3))
title('z coordinates','fontsize',14)
subplot(3,2,6)
plot(coordinates(:,3))
title('z coordinates','fontsize',14)


end