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
% Caso en que A sea matriz banda. Pediremos el semiancho de banda.
%
% Se necesita que la matriz A tenga todos sus menores principales no nulos.
%
% La función comprueba que A sea cuadrada con todos sus menores principales
% no nulos y que el tamaño de b coincida con el de A. También comprueba que
% el semiancho de banda esté entre 1 y el tamaño de A.
%
% Función factLUbanda:

function [ u, A ] = factLUbanda( A, p, b)

    n = size(A, 1);
    if n ~= size(A, 2)
        error('La matriz A no es cuadrada.');
    end
    if length(b) ~= n
        error('El tamaño de b no coincide con el de la matriz.');
    end
    if p < 1 || p > n
        error('El semiancho de banda toma un valor imposible.');
    end
    
    %Calculamos, si hace falta, la factorización LU de A
    if nargout == 2
        for i = 1:n
            %Solo hace falta multiplicar los elementos no nulos
            A(i, i) = A(i, i) - (A(i, max(i-p+1, 1):i-1) * A(max(i-p+1, 1):i-1, i));
            if A(i, i) == 0
                error('La matriz A no tiene todos sus menores principales no nulos.');
            end
            if p > 1
                %Sabemos que la factorización LU preserva la estructura de 
                %matrices banda.
                for j = i+1:min(i+p-1, n)
                    %Solo multiplicamos los elementos no nulos. Hay 
                    % (p-1)-(j-i) elementos no nulos encima de A(i, j)
                    
                    % A(i, j) = A(i, j) - (A(i, max(i-((p-1)-(j-i)), 1):i-1) * A(max(i-((p-1)-(j-i)), 1):i-1, j));
                    A(i, j) = A(i, j) - (A(i, max(j-p+1, 1):i-1) * A(max(j-p+1, 1):i-1, j));
                    A(j, i) = (A(j, i) - A(j, max(j-p+1, 1):i-1) * A(max(j-p+1, 1):i-1, i)) / A(i, i);
                end
            end
        end
    end

   %Resolvemos el sistema por el método del remonte
    w = zeros(n, 1);
    u = zeros(n, 1);

    w(1) = b(1);
    for i = 2:n
        w(i) = b(i) - (A(i, max(i-p+1, 1):i-1) * w(max(i-p+1, 1):i-1));
    end
    
    u(n) = w(n) / A(n, n);
    for i = n-1:-1:1
        u(i) = (w(i) - (A(i, i+1:min(i+p-1, n)) * u(i+1:min(i+p-1, n)))) / A(i, i);
    end

end
