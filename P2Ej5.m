A = input('Introduzca una matriz cuadrada A: ');
p = input('Potencia p a calcular: ');

if norm(A,1) < 1 
    disp('A tiene norma1 menor que 1');
end
if norm(A, Inf) < 1
    disp('A tiene normaInf menor que 1');
end
if norm(A, 'fro') < 1
    disp('A tiene normaF menor que 1');
end

disp('A^p: ');
disp(A^p);