% David Mallasén Quintana DG
%
% Practica 3 Ejercicio 8:
%
% Escribir una función que implemente el algoritmo para la resolución de
% sistemas lineales tridiagonales Ax = d dados por sus tres diagonales.
%
% Se necesita que los menores principales de A sean no nulos.    
%
% Función tridiag:

function x = tridiag( a, b, c, d ) 

    n = length(b);
    if length(a) ~= n-1 || length(b) ~= n || length(c) ~= n-1
        error('Los vectores a, b y c no forman una matriz tridiagonal.')
    end
    if length(d) ~= n
        error('El tamaño de d no coincide con el de la matriz.');
    end

    m = zeros(1, n);
    g = zeros(1, n);
    m(1) = b(1);
    if m(1) == 0
        error('La matriz A no tiene todos sus menores principales no nulos.');
    end
    g(1) = d(1) / m(1);
    for k = 2:n
        m(k) = b(k) - (c(k-1) * a(k-1)) / m(k-1);
        if m(k) == 0
            error('La matriz no tiene todos sus menores principales no nulos.');
        end
        g(k) = (d(k) - (g(k-1) * a(k-1))) / m(k);
    end

    x = zeros(1, n);
    x(n) = g(n);
    for k = n-1:-1:1
        x(k) = g(k) - (c(k) * x(k+1)) / m(k);
    end

end

