%__________________ Definicion de los parametros _______________%

R = 100; % Ohmios
L = 4e-3; % Henrios
C = 0.1e-6; % Faradios
V = 4; % Voltios
f = 500; % Hz
T = 0.01; % Segundos
t = 0:1e-6:T; % Vector de tiempo en segundos
u = (square(2*pi*f*t)/2)+1/2; % Señal de entrada (Tren de pulsos)

%__________________ Definicion de las matrices _______________%

A = [0 1; -1/(L*C) -R/L];
B = [0; V/(L*C)];
C = [1 0];
D = 0;

%__________________ Definicion de la dinamica del sistema _______________%

sys = ss(A,B,C,D);
[y,t,x] = lsim(sys,u,t);

%__________________ Grafica de la respuesta en el tiempo _______________%

figure(1);
plot(t,y);
grid on;
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Respuesta del circuito RLC a un tren de pulsos');

%__________________ Grafica del tren de pulsos _______________%

figure(2);
plot(t,u);
grid on;
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Tren de pulsos');

% ______________________________________________________ %