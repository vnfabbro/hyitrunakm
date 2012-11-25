function [pos_max_fila pos_max_columna valor]=func_max_imag(imag)
    [valor aux]=max(imag) %me devuelve el valor del maximo por columna, pero me da la posicion en la que esta(EN COLUMNA)
    [valor pos_max_columna]=max(valor);%cuando lo hago por segunda vez, me devuelve la columna en la que esta el maximo absoluto
    pos_max_fila=aux(pos_max_columna); %con el valor que averigue de la columna, ahora saco la fila del vector aux
end