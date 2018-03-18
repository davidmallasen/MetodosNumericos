% David Mallasén Quintana DG
%
% Practica 3 Ejercicio 7:
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
% La función comprueba que A sea cuadrada y definida positiva y que b tenga
% el tamaño de A. También comprueba que el semiancho de banda esté entre 1 
% y el tamaño de A.
%
% Se necesita que la matriz A sea simetrica y definida positiva.
%
% Función factCholbanda:

function [ u, A ] = factCholbanda( A, p, b )

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
    
    %Calculamos, si hace falta, la factorización Cholesky
    if nargout == 2
        for i = 1:n
            %Solo hace falta multiplicar los elementos no nulos
            A(i, i) = A(i, i) - (A(i, max(i-p+1, 1):i-1) * A(i, max(i-p+1, 1):i-1)');
            if A(i, i) <= 0
                error('La matriz A no admite factorización Cholesky.');
            end
            A(i, i) = sqrt(A(i, i));
            %Sabemos que la factorizacion Cholesky preserva la estructura
            %de matrices banda.
            for j = i+1:min(i+p-1, n)
                A(j, i) = (A(i, j) - (A(i, max(j-p+1, 1):i-1)* A(j, max(j-p+1, 1):i-1)')) / A(i, i);
            end
        end
    end

    %Resolvemos el sistema por el método del remonte
    w = zeros(n, 1);
    u = zeros(n, 1);

    w(1) = b(1) / A(1, 1);
    for i = 2:n
        w(i) = (b(i) - (A(i, max(i-p+1, 1):i-1) * w(max(i-p+1, 1):i-1))) / A(i, i);
    end

    u(n) = w(n) / A(n, n);
    for i = n-1:-1:1
        u(i) = (w(i) - (A(i+1:min(i+p-1, n), i)' * u(i+1:min(i+p-1, n)))) / A(i, i);
    end
    
end
