% David Mallasén Quintana DG
%
% Practica 5 Ej. 2 
% 
% Programar el cálculo de una función spline cúbica interpoladora de una
% función dada. Dibujar ambas funciones. Hacer, también en este caso, una
% versión que interpole los valores de una tabla dibujando la función
% spline cúbica obtenida y dichos valores.

x = input('Introduzca los puntos donde interpolar (deben estar ordenados de menor a mayor): ');
n = length(x) - 1;
ToF = input('Leer los valores de una tabla [0] o escribir la funcion [1]? [0/1]:');

if ToF == 0
    y = input('Introduzca los valores en los puntos anteriores en orden: ');
    if n + 1 ~= length(y)
        error('Debe haber el mismo numero de puntos que de valores.');
    end
elseif ToF == 1
    fstr=input('Dame la funcion con ''x'' como variable: ','s'); %Lo que va a recibir es un string, nos ahorramos poner las ''    
    fvec=vectorize(fstr); %Pasa los * / ^ a .* ./ .^ para que sea aplicable a vectores
    f=eval(['@(x) ' fvec]);  %Genera una funcion anonima con esa cadena de caracteres (creando un literal que es la orden de ejecutar la funcion)
    y = f(x);
    
    disp('Los valores obtenidos al evaluar la funcion en los puntos dados: ');
    disp(y);
else
    error('Error. Debe introducir un 0 para tabla o 1 para funcion.');
end

T1o2 = input('Aplicar condiciones de Tipo 1 o Tipo 2? [1/2]: ');

h = zeros(n+1, 1);
lambda = zeros(n, 1);
mu = zeros(n, 1);
d = zeros(n+1, 1);

h(2) = x(2) - x(1);
h(n+1) = x(n+1) - x(n);

if T1o2 == 1 %Condiciones tipo 1
    lambda(1) = 0;
    mu(n) = 0;
    d(1) = 0;
    d(n+1) = 0;
elseif T1o2 == 2 %Condiciones tipo 2
    if ToF == 0 %Tabla
        yPrima0 = input('Introduzca la derivada en el extremo izquierdo: ');
        yPriman = input('Introduzca la derivada en el extremo derecho: ');
    else  %Funcion
        fpvec=vectorize(diff(sym(f)));
        fprima=eval(['@(x) ' fpvec]);
        yPrima0 = fprima(x(1));
        yPriman = fprima(x(n+1));
        disp('La derivada en el extremo izquierdo: ');
        disp(yPrima0);
        disp('La derivada en el extremo derecho: ');
        disp(yPriman);
    end
    lambda(1) = 1;
    mu(n) = 1;
    d(1) = (6 / h(2)) * (((y(2) - y(1)) / h(2)) - yPrima0);
    d(n+1) = (6 / h(n+1)) * (yPriman - ((y(n+1) - y(n))/h(n+1)));
else
    error('Error. Debe introducir 1 para condiciones de Tipo 1 o 2 para condiciones de Tipo 2.');
end

for j = 2:n
    h(j+1) = x(j+1) - x(j);
    lambda(j) = h(j+1) / (h(j) + h(j+1));
    mu(j-1) = 1 - lambda(j);    %j-1 para que vaya de 1 a n
    d(j) = (6 / (h(j) + h(j+1))) * (((y(j+1) - y(j)) / h(j+1)) - ((y(j) - y(j-1)) / h(j)));
end
M = tridiag(mu, 2*ones(n+1, 1), lambda, d);

S = zeros(n, 4);

for j = 1:n
    beta = ((y(j+1) - y(j))/h(j+1)) - ((2*M(j) + M(j+1))/6) * h(j+1);
    gamma = M(j) / 2;
    delta = (M(j+1) - M(j)) / (6*h(j+1));
    
    aux = y(j);
    pAc = [1 -x(j)];
    aux = [0 aux] + beta * pAc;
    pAc = [pAc 0] - [0, pAc .* x(j)];
    aux = [0 aux] + gamma * pAc;
    pAc = [pAc 0] - [0, pAc .* x(j)];
    aux = [0 aux] + delta * pAc;
    S(j, :) = aux;
end

%Pintamos los puntos
plot(x, y, 'rs');
hold on

if ToF == 1 %Funcion
    %Pintamos la funcion
    fplot(f, [min(x), max(x)], 'g') 
end

%Pintamos la funcion spline en cada intervalo
for j = 1:n
    part = linspace(x(j), x(j+1));
    plot(part, polyval(S(j, :), part), 'b');
end
if ToF == 1  %Funcion
    legend('Puntos' ,'Funcion' , 'Spline', 'Location', 'Best')
else  %Tabla
    legend('Puntos' , 'Spline', 'Location', 'Best')
end

hold off