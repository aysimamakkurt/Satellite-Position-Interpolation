%Aysima Merve Akkurt 21531925
%delta_t_sat=[-2.0198e-04;1.8822e-04;4.2868e-04;-6.2634e-04;3.9168e-05;-6.8378e-04;-1.9018e-04;4.5014e-05];
%Berkay Bahadur's read sp3 file code
[sat] = read_sp3file('igs20491.sp3');
%for this homework, satellites
rn=[1 3 9 11 17 22 23 31];
%C1Cs
R=[21701762.326;20295421.408;23052558.884;23812404.587;24170557.238;21126498.884;21204753.717;22758838.705];  
%speed of light in a vacuum
c=2.99792458*10^8;
%Earth's rotation rate
wE=7292115.0*10^(-11);
%sat(4,4,rn) because 01.00.00 -satellite clock errors
a=sat(4,4,rn)
delta_t_sat=a(:,:);
delta_t=R./c;
%01.00.00=3600 sec
t_rcv_reception=3600;
t_sat_emission=t_rcv_reception-delta_t;
T_emission=t_sat_emission-delta_t_sat';
%r0_rcv=[4121934.2600 ;2652189.8120 ; 4069034.9110]
%t_rcv_emission=t_rcv_reception-delta_t;
%lagrange
y=sat(5,1,rn);
x=0:900:6400;
x0=T_emission;
y10=0;
n=length(x)-1;
for i=1:n+1
    t=1;
    for j=1:n+1
        if j ~= i
            t=t.*(x0-x(j))./(x(i)-x(j));
        end
    end
    y10=y10+y(i).*t;
end
ru_sat_x=y10;
y2=sat(5,2,rn);
y20=0;
%n=length(x)-1;
for i=1:n+1
    t=1;
    for j=1:n+1
        if j ~= i
            t=t.*(x0-x(j))./(x(i)-x(j));
        end
    end
    y20=y20+y2(i).*t;
end
ru_sat_y=y20;

y3=sat(5,3,rn);
y30=0;
n=length(x)-1;
for i=1:n+1
    t=1;
    for j=1:n+1
        if j ~= i
            t=t.*(x0-x(j))./(x(i)-x(j));
        end
    end
    y30=y30+y3(i).*t;
end
ru_sat_z=y30;
r_us_sat=[ru_sat_x,ru_sat_y,ru_sat_z];
new_delta_t_x=(4121934.26-1.961568436840897e+07).^2;
new_delta_t_y=(2652189.8120--1.482556256209972e+07).^2;
new_delta_t_z=(4069034.9110-1.033321704945695e+07).^2;
new_delta_t=sqrt(new_delta_t_x+new_delta_t_y+new_delta_t_z)/c;
tetha=wE*new_delta_t;
R3=[cos(tetha), sin(tetha) , 0; -sin(tetha), cos(tetha) ,0 ;0 , 0 ,1];
r_sat=(R3*r_us_sat')';
diff=(r_sat-r_us_sat)*10^-6;


