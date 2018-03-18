% David Mallasén Quintana DG
%
% Practica 3 Ejercicio 5:
%
% Crear una función que permita resolver un sistema lineal Au = b mediante
% la factorización LU de la matriz A de forma que si se llama con dos
% argumentos de salida calcule la factorización LU de A y la solución del
% sistema y, con un solo argumento, calcule únicamente la solución del
% sistema (suponiendo que en A están guardadas las matrices L y U).
% Utilizar dicha función para programar el método de la factorización LU de
% forma que se puedan resolver varios sistemas con la misma matriz.
%
% Caso en que A sea matriz banda. Pediremos el semiancho de banda p.
% 
% Se necesita que la matriz A tenga todos sus menores principales no nulos.
%
% Factorización LU para matrices banda:

disp('Factorización LU banda. Resolución de sistemas Au = b con A matriz banda con los menores principales no nulos.');

A = input('Introduzca la matriz A: ');
p = input('Introduzca el semiancho de banda: ');
b = input('Introduzca el segundo miembro b: ');

[u, A] = factLUbanda(A, p, b);

disp('u: ');
disp(u);

seguir = input('¿Quieres resolver para otro segundo miembro? [Sí=1, No=0]: ');

while seguir
    b = input('Introduzca el segundo miembro b: ');
    u = factLUbanda(A, p, b);

    disp('u: ');
    disp(u);
    
    seguir = input('¿Quieres resolver para otro segundo miembro? [Sí=1, No=0]: ');
end