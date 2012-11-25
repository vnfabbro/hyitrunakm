%Dada una imagen


function [ MatMaximos ] = func_ObtenerAreaMaximos(Imagen,Umbral)

[Filas , Columnas] = size(Imagen);
MatMaximos= zeros(size(Imagen));

for f=1: Filas
    for c=1:Columnas
        
       if Imagen(f,c)>= Umbral
         MatMaximos(f,c)=255; 
       else
         MatMaximos(f,c)=0;
       end
    end

end
end

