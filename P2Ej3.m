A = input('Matriz cuadrada A: ');

norm1 = max(sum(abs(A), 1));
disp('norm1(A): ');
disp(norm1);

disp('norm1(A)MATLAB: ');
disp(norm(A, 1));

normInf = max(sum(abs(A), 2));
disp('normInf(A): ');
disp(normInf);

disp('normInf(A)MATLAB: ');
disp(norm(A, Inf));

normF = sqrt(sum(sum(abs(A).^2)));
disp('normF(A): ');
disp(normF);

disp('normF(A)MATLAB: ');
disp(norm(A, 'fro'));