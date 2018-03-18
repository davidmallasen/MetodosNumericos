% Ejemplo de manejo y dibujo de funciones
fstr=input('Dame la funcion con ''x'' como variable  ','s'); %Lo que va a recibir es un string, nos ahorramos poner las ''
fvec=vectorize(fstr); %Pasa los * / ^ a .* ./ .^ para que sea aplicable a vectores
f=eval(['@(x) ' fvec]);  %Genera una funcion anonima con esa cadena de caracteres (creando un literal que es la orden de ejecutar la funcion)
x=0:7;
y=f(x); %Vector formado por f(0)...f(7)
disp(y)
fplot(f,[0 7]) %Dibujar la funcion en el intervalo dado
pause(3)
fpvec=vectorize(diff(sym(f)));
fprima=eval(['@(x) ' fpvec]);
y=fprima(x);
disp(y)
hold on
fplot(fprima,[0 7],'r')
legend('Funcion','Derivada','Location','Best')
title('Ejemplo de manejo y dibujo de funciones')