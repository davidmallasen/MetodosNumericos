% David Mallasén Quintana DG
% 
% Practica 3 Ejercicio 2: 
% 
% Programar el método de eliminación gaussiana, implementándolo siguiendo
% las indicaciones dadas en clase, de forma que sirva para resolver
% sucesivos sistemas con la misma matriz.
%
% Se necesita que la matriz A sea inversible. El script comprueba que A sea
% cuadrada e inversible y que b tenga el tamaño de A.

disp('Eliminación gaussiana. Resolución de sistemas Au = b con det(A) no nulo.');

A = input('Introduzca la matriz A: ');
n = size(A, 1);

if n ~= size(A, 2)
    error('La matriz A no es cuadrada.');
end

punt = 1:n;

%Calculamos L y U y las guardamos en A
for j = 1:n-1
    %Buscamos el máximo en valor absoluto de la parte de abajo de la 
    % columna del pivote
    [m, ind] = max(abs(A(punt(j:n), j)));
    
    %Ajustamos al indice de la fila de la matriz A (no del vector)
    ind = ind + j - 1; 
    
    if m == 0
        error('La matriz A no es inversible.');
    end
    
    %Intercambiamos la fila del pivote con la del maximo que hemos
    %encontrado
    punt([j,ind]) = punt([ind, j]);
    
    %Dividimos los elementos de la parte de abajo de la columna del pivote
    %por el pivote
    A(punt(j+1:n), j) = A(punt(j+1:n), j) / A(punt(j), j);
    
    %Restamos a las filas de submatriz inferior derecha la parte de la fila
    %del pivote por el elemento A(k,j)
    for k = j+1:n                           
        A(punt(k), j+1:n) = A(punt(k), j+1:n) - (A(punt(j), j+1:n) * A(punt(k),j));
    end
end

disp('LU: ');
disp(A);

%Resolvemos el sistema por el método del remonte
w = zeros(n, 1);
u = zeros(n, 1);
seguir = 1;
while seguir
    b = input('Introduzca el segundo miembro b: ');
    if length(b) ~= n
        error('El tamaño de b no coincide con el de la matriz.');
    end;
    
    w(1) = b(punt(1));
    for i = 2:n
       w(i) = b(punt(i)) - (A(punt(i), 1:i-1) * w(1:i-1));
    end
    
    u(n) = w(n) / A(punt(n), n);
    for i = n-1:-1:1
        u(i) = (w(i) - (A(punt(i), i+1:n) * u(i+1:n))) / A(punt(i), i);
    end
    
    disp('w: ');
    disp(w);
    disp('u: ');
    disp(u);
    
    seguir = input('¿Quieres resolver para otro segundo miembro? [Sí=1, No=0]: ');
end