M = input('Introduzca M: ');
N = input('Introduzca N: ');
n1 = input('Introduzca n1: ');

n = size(M, 1);

A = M(1:n1, 1:n1);
B = M(1:n1, n1+1:n);
C = M(n1+1:n, 1:n1);
D = M(n1+1:n, n1+1:n);

E = N(1:n1, 1:n1);
F = N(1:n1, n1+1:n);
G = N(n1+1:n, 1:n1);
H = N(n1+1:n, n1+1:n);

disp('MN total:');
MN = M*N;
disp(MN);
disp('MN por bloques:');
bl = [A*E+B*G A*F+B*H; C*E+D*G C*F+D*H];
disp(bl);
disp('Comparamos: ');
disp(MN == bl);