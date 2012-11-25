%Dada una imagen, y un umbral, me devuelve un anueva imagen con los que
%están por arriba o por debajo de ese umbral. El "arriba" o "abajo" se
%define en el tercer argumento con 1(para arriba)o 0 (para abajo)


function [ MatMaximos ] = func_filtrarImagenUmbral(Imagen,Umbral,may_men)

[Filas , Columnas] = size(Imagen);
MatMaximos= zeros(size(Imagen));

if may_men ==1
    
for f=1: Filas
    for c=1:Columnas
        
       if Imagen(f,c)>= Umbral
         MatMaximos(f,c)=255; 
       else
         MatMaximos(f,c)=0;
       end
    end

end

else
    
    for f=1: Filas
    for c=1:Columnas
        
       if Imagen(f,c)<= Umbral
         MatMaximos(f,c)=255; 
       else
         MatMaximos(f,c)=0;
       end
    end

    end

end

end

