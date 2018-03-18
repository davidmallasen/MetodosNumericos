% David Mallas�n Quintana DG
%
% Practica 4 Ejercicio 2:
%  
% Escribir un programa que resuelva un sistema lineal mediante el m�todo
% de relajaci�n por puntos, pidiendo por pantalla, adem�s de la matriz y el
% segundo miembro, el par�metro de relajaci�n, el n�mero m�ximo de
% iteraciones y la precisi�n para el test de parada.
% 
% Devuelve el vector soluci�n y la raz�n de parada. 

A = input('Introduzca la matriz A: ');
n = size(A, 1);
if n ~= size(A, 2)
    error('La matriz A no es cuadrada.');
end
if ~all(diag(A))
    error('No se puede aplicar el metodo de relajaci�n a la matriz. Tiene algun elemento de la diagonal nulo.');
end

b = input('Introduzca el vector b: ');
if length(b) ~= n
    error('El tama�o de b no coincide con el de la matriz.');
end

prec = input('Introduzca la preci�n deseada: ');

w = input('Introduzca el par�metro de relajaci�n: ');

maxIt = input('Introduzca el n�mero m�ximo de iteraciones: ');
if maxIt <= 0
    error('El n�mero m�ximo de iteraciones debe ser mayor que 0.');
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

disp('El vector soluci�n u: ');
disp(u);

if nIt == maxIt
    disp('Se ha alcanzado el n�mero m�ximo de iteraciones.');
else
    disp('Se ha alcanzado la precisi�n deseada en la iteraci�n: ');
    disp(nIt);
end