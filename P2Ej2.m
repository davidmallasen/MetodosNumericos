A = input('Introduzca A: ');
B = input('Introduzca B: ');

%det(AB)=det(BA)=det(A)det(B)
disp('det(AB):');
AB = det(A*B);
disp(AB);

disp('det(BA):');
BA = det(B*A);
disp(BA);

disp('det(A)det(B):');
A_B = det(A)*det(B);
disp(A_B);

disp('det(AB) == det(BA)');
disp(all(all(AB == BA)));
disp('det(AB) == det(A)det(B)');
disp(all(all(AB == A_B)));

%det(kA) = k^n*det(A)
k = input('Introduzca k: ');
kA = det(k*A);
disp('det(kA):');
disp(kA);

n = size(A, 1);
knA = k^n * det(A);
disp('k^n*det(A):');
disp(knA);

disp('det(kA) == k^n*det(A)');
disp(all(kA == knA));

%det(A*) = conj(det(A))
disp('det(A*): ');
adjA = det(A');
disp(adjA);

disp('conj(det(A)): ');
conjA = conj(det(A));
disp(conjA);

disp('det(A*) = conj(det(A))');
disp(all(all(adjA == conjA)));

%det(A) = prod(eig(A))
disp('det(A): ');
disp(det(A));
disp('prod(eig(A))');
a = eig(A);
peigA = 1;
for i = 1:size(a)
    peigA = peigA * a(i);
end
disp(peigA);

disp('det(A) = prod(eig(A))');
disp(det(A) == peigA);

