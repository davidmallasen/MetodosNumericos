S1 = input('S1 = Mat. triang. sup. dim. nxn:');
I1 = input('I1 = Mat. triang. inf. dim. nxn:');
v = input('v = Vector columna dim n: ');

n = size(S1, 1);

u1 = zeros(n, 1);
for i = 1:n
   u1(i) = S1(i,i:n)*v(i:n); 
end

disp('S1*v = ');
disp(u1);

u2 = zeros(n, 1);
for i = 1:n
    u2(i) = I1(i,1:i)*v(1:i);
end

disp('I1*v = ');
disp(u2);

S2 = input('S2 = Mat. triang sup. dim nxn:');
I2 = input('I2 = Mat. triang inf. dim nxn:');

v1 = zeros(n,n);
for i = 1:n
    for j = i:n
        v1(i,j) = S1(i,i:j)*S2(i:j,j);
    end
end

disp('S1*S2 = ');
disp(v1);

v2 = zeros(n,n);
for i = 1:n
    for j = 1:i
        v2(i,j) = I1(i,j:i)*I2(j:i,j);
    end
end

disp('I1*I2 = ');
disp(v2);
