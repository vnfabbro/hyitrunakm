function [angulo] = func_ObtenerAngulo(MatMaximos)

%Obtengo la fila y la columna de lo que ser�a un punto que agrego. Este
%punto tiene la misma fila que el punto v�rtice ya calculado, y la misma
%columna que el punto inferior derecho de la imagen original. As� se forma
%un tri�ngulo rect�ngulo, con el cual se pueden calcular el opuesto y el
%adyacente, para sacar el �ngulo con el arcotangente.
F5 = MatMaximos(2,1);
C5=MatMaximos(4,2);


opuesto=abs( MatMaximos(4,1)- F5) ;
adyacente= abs(C5 - MatMaximos(2,2));

x= opuesto/adyacente;
RadianAngle= atan(x);

angulo=-RadianAngle*180/pi; %pongo el - para que gire para el otro lado

end

