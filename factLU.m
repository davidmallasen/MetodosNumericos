% David Mallas�n Quintana DG
%
% Practica 3 Ejercicio 4:
%
% Crear una funci�n que permita resolver un sistema lineal Au = b mediante
% la factorizaci�n LU de la matriz A de forma que si se llama con dos
% argumentos de salida calcule la factorizaci�n LU de A y la soluci�n del
% sistema y, con un solo argumento, calcule �nicamente la soluci�n del
% sistema (suponiendo que en A est�n guardadas las matrices L y U).
% Utilizar dicha funci�n para programar el m�todo de la factorizaci�n LU de
% forma que se puedan resolver varios sistemas con la misma matriz.
%
% Se necesita que la matriz A tenga todos sus menores principales no nulos.
%
% La funci�n comprueba que A sea cuadrada con todos sus menores principales
% no nulos y que el tama�o de b coincida con el de A.
%
% Funci�n factLU:

function [ u, A ] = factLU( A, b )

    n = size(A, 1);
    if n ~= size(A, 2)
        error('La matriz A no es cuadrada.');
    end
    if length(b) ~= n
        error('El tama�o de b no coincide con el de la matriz.');
    end
    
    %Calculamos, si hace falta, la factorizaci�n LU de A
    if nargout == 2
        for i = 1:n
            A(i, i) = A(i, i) - (A(i, 1:i-1) * A(1:i-1, i));
            if A(i, i) == 0
                error('La matriz A no tiene todos sus menores principales no nulos.');
            end
            for j = i+1:n
                A(i, j) = A(i, j) - (A(i, 1:i-1) * A(1:i-1, j));
                A(j, i) = (A(j, i) - A(j, 1:i-1) * A(1:i-1, i)) / A(i, i);
            end
        end
    end

    %Resolvemos el sistema por el m�todo del remonte
    w = zeros(n, 1);
    u = zeros(n, 1);

    w(1) = b(1);
    for i = 2:n
        w(i) = b(i) - (A(i, 1:i-1) * w(1:i-1));
    end

    u(n) = w(n) / A(n, n);
    for i = n-1:-1:1
        u(i) = (w(i) - (A(i, i+1:n) * u(i+1:n))) / A(i, i);
    end

end
