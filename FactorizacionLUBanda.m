% David Mallas�n Quintana DG
%
% Practica 3 Ejercicio 5:
%
% Crear una funci�n que permita resolver un sistema lineal Au = b mediante
% la factorizaci�n LU de la matriz A de forma que si se llama con dos
% argumentos de salida calcule la factorizaci�n LU de A y la soluci�n del
% sistema y, con un solo argumento, calcule �nicamente la soluci�n del
% sistema (suponiendo que en A est�n guardadas las matrices L y U).
% Utilizar dicha funci�n para programar el m�todo de la factorizaci�n LU de
% forma que se puedan resolver varios sistemas con la misma matriz.
%
% Caso en que A sea matriz banda. Pediremos el semiancho de banda p.
% 
% Se necesita que la matriz A tenga todos sus menores principales no nulos.
%
% Factorizaci�n LU para matrices banda:

disp('Factorizaci�n LU banda. Resoluci�n de sistemas Au = b con A matriz banda con los menores principales no nulos.');

A = input('Introduzca la matriz A: ');
p = input('Introduzca el semiancho de banda: ');
b = input('Introduzca el segundo miembro b: ');

[u, A] = factLUbanda(A, p, b);

disp('u: ');
disp(u);

seguir = input('�Quieres resolver para otro segundo miembro? [S�=1, No=0]: ');

while seguir
    b = input('Introduzca el segundo miembro b: ');
    u = factLUbanda(A, p, b);

    disp('u: ');
    disp(u);
    
    seguir = input('�Quieres resolver para otro segundo miembro? [S�=1, No=0]: ');
end