
%esta función recibe la Imagen y un valor, y sólo se queda con los valores
%iguales a ese valor

function [ ImagenFiltrada] = func_filtradoEspecial(Imagen,Valor)

[Filas , Columnas] = size(Imagen);
ImagenFiltrada= zeros(size(Imagen));

for fil=1:Filas
    for col=1:Columnas
        
        if Imagen(fil,col)==Valor
            ImagenFiltrada(fil,col)=255;
        else
            ImagenFiltrada(fil,col)=0;
        end
        
    end
end



end

