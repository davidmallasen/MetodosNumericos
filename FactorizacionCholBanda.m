% David Mallas�n Quintana DG
%
% Practica 3 Ejercicio 7:
%
% Crear una funci�n que permita resolver un sistema lineal Au = b mediante
% la factorizaci�n de Cholesky de la matriz A de forma que si se llama con
% dos argumentos de salida calcule la factorizaci�n de Cholesky de A y la
% soluci�n del sistema y, con un solo argumento, calcule �nicamente la
% soluci�n del sistema (suponiendo que en A est� guardada la matriz B).
% Usando esta funci�n, programar el m�todo de la factorizaci�n de Cholesky
% de forma que se puedan resolver varios sistemas con la misma matriz.
%
% Caso en que A sea matriz banda. Pediremos el semiancho de banda p.
%
% Se necesita que la matriz A sea simetrica y definida positiva.
%
% Factorizaci�n Cholesky para matrices banda:

disp('Factorizaci�n Cholesky. Resoluci�n de sistemas Au = b con A matriz banda, sim�trica y definida positiva.');

A = input('Introduzca la matriz A: ');
p = input('Introduzca el semiancho de banda: ');
b = input('Introduzca el segundo miembro b: ');

[u, A] = factCholbanda(A, p, b);

disp('u: ');
disp(u);

seguir = input('�Quieres resolver para otro segundo miembro? [S�=1, No=0]: ');
while seguir
    b = input('Introduzca el segundo miembro b: ');
    
    u = factCholbanda(A, p, b);

    disp('u: ');
    disp(u);
    
    seguir = input('�Quieres resolver para otro segundo miembro? [S�=1, No=0]: ');
end