% David Mallas�n Quintana DG
%
% Practica 4 Ejercicio 1:
%  
% Escribir un programa que resuelva un sistema lineal mediante el m�todo de 
% Jacobi por puntos, pidiendo por pantalla, adem�s de la matriz y el segundo 
% miembro, el n�mero m�ximo de iteraciones y la precisi�n para el test de 
% parada.
% 
% Devuelve el vector soluci�n y la raz�n de parada. 

A = input('Introduzca la matriz A: ');
n = size(A, 1);
if n ~= size(A, 2)
    error('La matriz A no es cuadrada.');
end
if ~all(diag(A))
    error('No se puede aplicar el metodo de Jacobi a la matriz. Tiene algun elemento de la diagonal nulo.');
end

b = input('Introduzca el vector b: ');
if length(b) ~= n
    error('El tama�o de b no coincide con el de la matriz.');
end

prec = input('Introduzca la preci�n deseada: ');

maxIt = input('Introduzca el n�mero m�ximo de iteraciones: ');
if maxIt <= 0
    error('El n�mero m�ximo de iteraciones debe ser mayor que 0.');
end

u = b;
r = b - (A * u')';

parada = prec * norm(b, Inf);
nIt = 0;
while nIt < maxIt && (norm(r, Inf) >= parada)
    d = r ./ diag(A)';
    u = u + d;
    r = b - (A * u')';

    nIt = nIt + 1;
end

disp('El vector soluci�n u: ');
disp(u);

if nIt == maxIt
    disp('Se ha alcanzado el n�mero m�ximo de iteraciones.');
else
    disp('Se ha alcanzado la precisi�n deseada en la iteraci�n: ');
    disp(nIt);
end