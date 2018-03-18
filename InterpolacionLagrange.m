% David Mallasén Quintana DG
%
% Practica 5 Ej. 1
% 
% Escribir un programa que calcule el polinomio de interpolación de
% Lagrange de una función en unos puntos dados mediante la fórmula de
% Newton, y que permita añadir nuevos puntos de interpolación (de uno en
% uno). Dibujar la función y el polinomio de interpolación obtenido. Hacer
% una versión que sirva para interpolar los valores de una tabla dibujando,
% en este caso, el polinomo de interpolación y los valores interpolados.

x = input('Introduzca los puntos donde interpolar: ');
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

tabla = y;  %En lugar de ocupar toda una tabla, nos vale con un vector

Pol = y(1); %El polinomio de interpolacion, en la posicion 1 esta f(x_0)
p = 1;   %La funcion pi

for i = 1:n
    for j = 1:n+1-i  %Actualizamos la tabla
       tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(j+i));
    end
    
    p = [p 0] - [0, p .* x(i)]; %Actualizamos pi
    Pol =  [0 Pol] + p * tabla(1);  %Sumamos la iteracion del polinomio
end

%Pintamos los puntos
plot(x, y, 'rs');
hold on
%Pintamos el polinomio
part = linspace(min(x), max(x));
plot(part, polyval(Pol, part));

if ToF == 1 %Funcion
    %Pintamos la funcioin
    fplot(f, [min(x), max(x)], 'g')
end
legend('Puntos' ,'Pol.Int.', 'Funcion','Location','Best')
hold off

seguir = input('¿Añadir nuevo punto, sí[1] o no[0]? [0/1]: ');
if seguir ~= 0 && seguir ~= 1
    error('Error. Debe introducir un 0 o 1.');
end
while seguir
    n = n+1;
    x(n+1) = input('Nuevo punto donde interpolar: '); %Añadimos el nuevo punto en una nueva ultima posicion

    if ToF == 0 %Tabla
        y(n+1) = input('Valor en el punto nuevo: ');
    else        %Funcion
        y(n+1) = f(x(n+1));
    end

    tabla(n+1) = y(n+1);
    for j = n:-1:1  %Actualizamos la tabla
        tabla(j) = (tabla(j) - tabla(j+1)) / (x(j) - x(n+1));
    end

    p = [p 0] - [0, p .* x(n)]; %Actualizamos pi, por si hay punto nuevo
    Pol =  [0 Pol] + p * tabla(1);  %Sumamos la iteracion del polinomio
    
    %Pintamos los puntos
    plot(x, y, 'rs');
    hold on
    %Pintamos el polinomio
    part = linspace(min(x), max(x));
    plot(part, polyval(Pol, part));

    if ToF == 1 %Funcion
        %Pintamos la funcioin
        fplot(f, [min(x), max(x)], 'g')
    end
    legend('Puntos' ,'Pol.Int.', 'Funcion','Location','Best')
    hold off
    
    seguir = input('¿Añadir nuevo punto, sí[1] o no[0]? [0/1]: ');
    if seguir ~= 0 && seguir ~= 1
        error('Error. Debe introducir un 0 o 1.');
    end
end
 