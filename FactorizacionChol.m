% David Mallasén Quintana DG
%
% Practica 3 Ejercicio 6:
%
% Crear una función que permita resolver un sistema lineal Au = b mediante
% la factorización de Cholesky de la matriz A de forma que si se llama con
% dos argumentos de salida calcule la factorización de Cholesky de A y la
% solución del sistema y, con un solo argumento, calcule únicamente la
% solución del sistema (suponiendo que en A está guardada la matriz B).
% Usando esta función, programar el método de la factorización de Cholesky
% de forma que se puedan resolver varios sistemas con la misma matriz.
%
% Se necesita que la matriz A sea simetrica y definida positiva.
%
% Factorización Cholesky:

disp('Factorización Cholesky. Resolución de sistemas Au = b con A simétrica y definida positiva.');

A = input('Introduzca la matriz A: ');
b = input('Introduzca el segundo miembro b: ');

[u, A] = factChol(A, b);

disp('u: ');
disp(u);

seguir = input('¿Quieres resolver para otro segundo miembro? [Sí=1, No=0]: ');
while seguir
    b = input('Introduzca el segundo miembro b: ');
    
    u = factChol(A, b);

    disp('u: ');
    disp(u);
    
    seguir = input('¿Quieres resolver para otro segundo miembro? [Sí=1, No=0]: ');
end
