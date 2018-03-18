% David Mallas�n Quintana DG
%
% Practica 3 Ejercicio 6:
%
% Crear una funci�n que permita resolver un sistema lineal Au = b mediante
% la factorizaci�n de Cholesky de la matriz A de forma que si se llama con
% dos argumentos de salida calcule la factorizaci�n de Cholesky de A y la
% soluci�n del sistema y, con un solo argumento, calcule �nicamente la
% soluci�n del sistema (suponiendo que en A est� guardada la matriz B).
% Usando esta funci�n, programar el m�todo de la factorizaci�n de Cholesky
% de forma que se puedan resolver varios sistemas con la misma matriz.
%
% Se necesita que la matriz A sea simetrica y definida positiva. 
% 
% La funci�n comprueba que A sea cuadrada y definida positiva y que b tenga 
% el tama�o de A.
%
% Funci�n factChol:

function [ u, A ] = factChol( A, b )

    n = size(A, 1);
    if n ~= size(A, 2)
        error('La matriz A no es cuadrada.');
    end
    if length(b) ~= n
        error('El tama�o de b no coincide con el de la matriz.');
    end

    %Calculamos, si hace falta, la factorizaci�n Cholesky
    if nargout == 2
        for i = 1:n
            A(i, i) = A(i, i) - (A(i, 1:i-1) * A(i, 1:i-1)');
            if A(i, i) <= 0
                error('La matriz A no admite factorizaci�n Cholesky.');
            end
            A(i, i) = sqrt(A(i, i));
            for j = i+1:n
                A(j, i) = (A(i, j) - (A(i, 1:i-1)* A(j, 1:i-1)')) / A(i, i);
            end
        end
    end

    %Resolvemos el sistema por el m�todo del remonte
    w = zeros(n, 1);
    u = zeros(n, 1);

    w(1) = b(1) / A(1, 1);
    for i = 2:n
        w(i) = (b(i) - (A(i, 1:i-1) * w(1:i-1))) / A(i, i);
    end

    u(n) = w(n) / A(n, n);
    for i = n-1:-1:1
        u(i) = (w(i) - (A(i+1:n, i)' * u(i+1:n))) / A(i, i);
    end

end

