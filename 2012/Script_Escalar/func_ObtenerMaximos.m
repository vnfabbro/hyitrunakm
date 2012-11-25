%Esta funcion me devuelve en una matriz la fila, la columna y el valor de
%la cantidad de maximos que deseo calcular
%Recibe una imagen y la cantidad de maximos que deseo calcular

function [ MatMaximos ] = func_ObtenerMaximos(Imagen,cant)
MatMaximos = zeros(4,3);
tamanio=1;
for i=1:cant
    [valor aux]= max(Imagen);  %me devuelve el valor del maximo por columna, pero me da la posicion en la que esta(EN COLUMNA)
    [valor pos_max_columna]=max(valor); %cuando lo hago por segunda vez, me devuelve la columna en la que esta el maximo absoluto
    pos_max_fila=aux(pos_max_columna); %con el valor que averigue de la columna, ahora saco la fila del vector aux
    
    MatMaximos(i,1) = pos_max_fila;
    MatMaximos(i,2) = pos_max_columna;
    MatMaximos(i,3) = valor;
    
    Imagen((pos_max_fila -tamanio):(pos_max_fila+tamanio),(pos_max_columna-tamanio):(pos_max_columna+tamanio))=0;
end

end

