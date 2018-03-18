% David Mallasén Quintana DG
%
% Practica 4 Ejercicio 2:
%  
% Escribir un programa que resuelva un sistema lineal mediante el método
% de relajación por puntos, pidiendo por pantalla, además de la matriz y el
% segundo miembro, el parámetro de relajación, el número máximo de
% iteraciones y la precisión para el test de parada.
% 
% Devuelve el vector solución y la razón de parada. 

A = input('Introduzca la matriz A: ');
n = size(A, 1);
if n ~= size(A, 2)
    error('La matriz A no es cuadrada.');
end
if ~all(diag(A))
    error('No se puede aplicar el metodo de relajación a la matriz. Tiene algun elemento de la diagonal nulo.');
end

b = input('Introduzca el vector b: ');
if length(b) ~= n
    error('El tamaño de b no coincide con el de la matriz.');
end

prec = input('Introduzca la preción deseada: ');

w = input('Introduzca el parámetro de relajación: ');

maxIt = input('Introduzca el número máximo de iteraciones: ');
if maxIt <= 0
    error('El número máximo de iteraciones debe ser mayor que 0.');
end

u = b;
r = zeros(n);
d = zeros(n);

parada = prec * norm(b, Inf);
nIt = 0;
seguir = 1;
while seguir
    for i = 1:n
        r(i) = b(i) - (A(i, 1:i-1) * u(1:i-1)') - (A(i, i:n) * u(i:n)');
        d(i) = w * (r(i) / A(i, i));
        u(i) = u(i) + d(i);
    end
    
    if nIt >= maxIt || (norm(r, Inf) < parada)
        seguir = 0;
    end
    nIt = nIt + 1;
end

disp('El vector solución u: ');
disp(u);

if nIt == maxIt
    disp('Se ha alcanzado el número máximo de iteraciones.');
else
    disp('Se ha alcanzado la precisión deseada en la iteración: ');
    disp(nIt);
end